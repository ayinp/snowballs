extends Area2D


func _on_Attackbox_body_entered(body):
	if body.name == "Player":
		body.health -= 1
		print('health: ',body.health)
