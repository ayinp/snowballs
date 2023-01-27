extends RigidBody2D

var direction = 0
onready var my_id = "snowball"

func _on_Snowball_body_entered(_body):
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("deleted")



