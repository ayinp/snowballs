extends Area2D



func _on_Hurtbox_body_entered(body):
	if body.my_id == "snowball":
		print("hit")
		get_parent().queue_free()

	
