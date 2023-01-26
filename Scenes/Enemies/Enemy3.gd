extends KinematicBody2D
var my_id = 'Child'
var go = false
var speed = 80
var motion = Vector2(0,0)
#onready var p = $"../../Player"
var p = null
onready var rat = $"."


func _physics_process(delta):
	if go == true:
			motion = position.direction_to(p.position) * speed

	motion = move_and_slide(motion)

func _on_Visibility_body_entered(body):
	if body.name == 'Player':
		p = body
		go = true
		print('lalal')
