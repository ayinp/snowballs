extends Area2D

func _on_player_hurtbox_body_entered(body):
	if body.name == "Enemy Snowball":
		print("hit")
		queue_free()
