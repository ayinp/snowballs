extends RigidBody2D

var direction = 0
onready var my_id = "snowball"

func _ready():
	# Start the timer
	$TravelDistance.start()

func _on_TravelDistance_timeout():
	# Delete the projectile
	queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("deleted")
	
func _on_Snowball_body_entered(body):
	if body.is_in_group("enemies"):
		queue_free()
