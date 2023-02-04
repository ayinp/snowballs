extends Area2D
onready var parent = $".."
func _on_player_hurtbox_body_entered(body):
	if body.name == "Enemy Snowball" and parent.crouch == false:
		get_parent().health -= 1	
