extends Area2D

func _on_hurtbox_body_entered(body):
	if body.my_id == "snowball":
		print("hit")
		body.queue_free()
		get_parent().queue_free()
