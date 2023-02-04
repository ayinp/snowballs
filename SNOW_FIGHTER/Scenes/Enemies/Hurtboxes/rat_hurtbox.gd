extends Area2D

onready var parent_box = $".."

func _on_Hurtbox_body_entered(body):
	if body.my_id == "snowball" and parent_box.crouch == false:
		print("hit")
		body.queue_free()
		get_parent().queue_free()
	if body.name == "Player":
		body.health -= 1 
		print(body.health)
	
