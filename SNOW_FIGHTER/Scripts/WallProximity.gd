extends Area2D

var in_area = false
var enemy_in = false
onready var wall = get_parent()

func _on_WallProximity_body_entered(body):
	if body.name == "Player":
		in_area = true
		wall.set_collision_mask_bit(2, false)
	if body.is_in_group("enemies"):
		enemy_in = true
		wall.set_collision_mask_bit(5, false)
	
func _on_WallProximity_body_exited(body):
	if body.name == "Player":
		in_area = false
		wall.set_collision_mask_bit(2, true)
	if body.is_in_group("enemies"):
		enemy_in = false
		wall.set_collision_mask_bit(5, true)
