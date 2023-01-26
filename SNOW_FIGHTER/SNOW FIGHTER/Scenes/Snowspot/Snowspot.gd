extends Area2D

func _on_Snowspot_body_entered(body):
	if body.name == "Player":
		body.in_snowspot = true

func _on_Snowspot_body_exited(body):
	if body.name == "Player":
		body.in_snowspot = false
