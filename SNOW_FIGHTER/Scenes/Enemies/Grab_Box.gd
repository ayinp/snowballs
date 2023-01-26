extends Area2D

func _on_Grab_Box_body_entered(body):
	if body.name == "Player":
		body.speed = 20
		
func _on_Grab_Box_body_exited(body):
	if body.name == "Player":
		body.speed = 75
