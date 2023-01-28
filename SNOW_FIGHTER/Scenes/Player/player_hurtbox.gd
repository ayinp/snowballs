extends Area2D

func _on_player_hurtbox_body_entered(body):
	if body.name == "Enemy Snowball":
		get_parent().health -= 1	
	else:
		pass
