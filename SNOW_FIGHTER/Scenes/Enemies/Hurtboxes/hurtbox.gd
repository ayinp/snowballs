extends Area2D
onready var parent = $".."
func _on_hurtbox_body_entered(body):
	if body.is_in_group("snowball") and parent.crouch == false:
		print("hit")
		body.queue_free()
		get_parent().queue_free()
