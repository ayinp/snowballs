extends Area2D



func _on_Hurtbox_body_entered(body):
	if body.my_id == "snowball":
		print("hit")
		body.queue_free()
		get_parent().queue_free()
	if body.name == "Player":
		body.health -= 1 
		print(body.health)
	
