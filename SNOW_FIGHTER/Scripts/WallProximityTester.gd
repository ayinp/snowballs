extends Area2D

onready var wall = get_parent()

func _on_WallProximity_body_entered(body):
	if body.name == "Player":
		body.in_cover = true
		print(body.in_cover)
	if body.is_in_group("enemies"):
		body.in_cover = true
func _on_WallProximity_body_exited(body):
	if body.name == "Player":
		body.in_cover = false
		print(body.in_cover)
	if body.is_in_group("enemies"):
		body.in_cover = false
