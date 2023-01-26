extends Area2D



func _on_Child_Hurtbox_body_entered(body):
		if body.name == "Snowball":
			print("hit")
			body.queue_free()
			get_parent().queue_free()

