extends Area2D

onready var wall = get_parent()

func _on_WallProximity_body_entered(body):
	if body.name == "Player":
		body.crouch = true
		print(body.crouch)
	if body.is_in_group("enemies"):
		body.crouch = true
		print(body.crouch)
func _on_WallProximity_body_exited(body):
	if body.name == "Player":
		body.crouch = false
		print(body.crouch)
	if body.is_in_group("enemies"):
		body.crouch = false
