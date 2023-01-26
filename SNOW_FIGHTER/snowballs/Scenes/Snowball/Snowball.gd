extends RigidBody2D

var direction = 0
var my_id = "snowball"

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("deleted")

func _on_Snowball_body_entered(body):
	if body.is_in_group("enemies"):
		body.queue_free()
