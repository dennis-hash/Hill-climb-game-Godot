extends RigidBody2D

var wheels = []
var speed = 40000
var max_speed = 50

var fuel = 100

func _ready():
	wheels = get_tree().get_nodes_in_group("Wheel") #search for all the Wheel in the wheel group and put them in the array
	get_parent().update_fuel_ui(fuel)
	
#Add some player input
func _physics_process(delta):
	if fuel > 0:
		$GameOverTimer.stop()
		if Input.is_action_pressed("ui_right"):
			use_fuel(delta)
			#apply force to the wheel. we use the tork function 
			for wheel in wheels:
				if wheel.angular_velocity < max_speed:
					wheel.apply_torque_impulse(speed * delta * 60) #multiply by delta to account for the frames drop, 60 is the physics frame rate
		if Input.is_action_pressed("ui_left"):
			use_fuel(delta)
			#apply force to the wheel. we use the tork function 
			for wheel in wheels:
				if wheel.angular_velocity > -max_speed:
					wheel.apply_torque_impulse(-speed * delta * 60) #multiply by delta to account for the frames drop, 60 is the physics frame rate
					
		else:
			if $GameOverTimer.is_stopped():
				$GameOverTimer.start()
		print(fuel)
		
func refuel():
	fuel = 100
	get_parent().update_fuel_ui(fuel)
	
func use_fuel(delta):
	fuel -= 10 * delta
	fuel = clamp(fuel, 0, 100)
	get_parent().update_fuel_ui(fuel)
			


func _on_game_over_timer_timeout():
	get_tree().reload_current_scene()
