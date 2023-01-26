extends Area2D

var in_area = false
var first_throw = true

func _on_WallProximity_body_entered(_body: PhysicsBody) -> void:
	in_area = true
	var wall = get_parent()
	wall.set_collision_mask_bit(2, false)
	
func _on_WallProximity_body_exited(_body: PhysicsBody) -> void:
	in_area = false
	first_throw = false
	var wall = get_parent()
	wall.set_collision_mask_bit(2, true)
