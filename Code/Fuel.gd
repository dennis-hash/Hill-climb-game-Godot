extends Area2D




func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().get_current_scene().get_node("Player").refuel()
		$AnimationPlayer.play("animteCoin") #play the animation
		$CollisionShape2D.set_deferred("disabled", true)
		

func _on_animation_player_animation_finished(anim_name):
	queue_free()
