extends Area2D



func _on_Hurtbox_body_entered(body):
	if body.name == "Snowball":
		print("hit")
		get_parent().queue_free()
	if body.name == "Player":
		body.queue_free()
	
