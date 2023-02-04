extends RigidBody2D

var direction = 0
var my_id = "Enemy Snowball"

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Enemy_Snowball_body_entered(body):
	queue_free()
