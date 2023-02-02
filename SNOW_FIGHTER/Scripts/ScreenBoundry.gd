extends Area2D

func _on_ScreenBoundry_body_entered(body):
	if body.my_id == "Player":
		pass

func _on_ScreenBoundry_body_exited(body):
	if body.my_id == "Player":
		pass
