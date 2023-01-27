extends Area2D

func _on_hurtbox_body_entered(body):
	if body.is_in_group("snowball"):
		print("hit")
		body.queue_free()
		get_parent().queue_free()
