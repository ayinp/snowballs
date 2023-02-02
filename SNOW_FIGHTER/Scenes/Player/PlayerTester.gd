extends KinematicBody2D
var my_id = "Player"

# player variables
var velocity = Vector2.ZERO
export var health = 1
export var speed = 80
export var accel = 8
export var friction = 7
onready var animation = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var state = MOVE

enum {
	MOVE,
	PICKUP,
}

# items
onready var snowflakes = 0
onready var jacket = false
onready var pocket = false

# snowball variables
export var snowball_speed = 250
var snowball = preload("res://Scenes/Snowball/Snowball.tscn")
var has_snowball = false
var max_snowball = 2
var snowball_amount = 0
onready var snowspot
var in_snowspot = false

func _ready():
	animationTree.active = true 
	print(snowball_amount)
	print(in_snowspot)
	
func _process(_delta):
	death()
	snowbug()
	
func _physics_process(_delta):
	match state:
		MOVE:
			wasd_move()
			mouse_look()
		PICKUP:
			grab_snowball()
	
# Debug mode
func snowbug():
	var debug_mode = false
	if Input.is_action_just_pressed("debug_mode"):
		debug_mode = true
		print("Debug mode: ", debug_mode)
	while debug_mode == true:
		has_snowball = true
		max_snowball = 10
		health = 100
		snowball_amount = 10
		break
		
# movement with W, A, S, D keys  
func wasd_move():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_direction = input_direction.normalized()
	
	if input_direction != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_direction)
		animationTree.set("parameters/walk/blend_position", input_direction)
		animationTree.set("parameters/make_ball/blend_position", input_direction)
		animationState.travel("walk")
		velocity = velocity.move_toward(input_direction * speed, accel)
	else:
		animationState.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("grab_snowball") and snowball_amount < max_snowball:
		state = PICKUP
# Aiming with Mouse Right Click
# TODO: Sync animation with snowball throw point
func mouse_look():
	var node_ref = $"Snowball-Point"
	var pos_player = node_ref.get_global_position()
	var pos_mouse = get_global_mouse_position()
	var direction = (pos_mouse - pos_player).normalized()
	
	if Input.is_action_pressed("ui_accept"):
		animationTree.set("parameters/idle/blend_position", direction)
		animationTree.set("parameters/walk/blend_position", direction)
		animationTree.set("parameters/make_ball/blend_position", direction)
		animationTree.set("parameters/throw/blend_position", direction)
		
		# Throw Snowball
		if Input.is_action_just_pressed("throw_projectile"):
			animationState.travel("throw")
			if has_snowball:
				var snowball_instance = snowball.instance()
				snowball_instance.position = pos_player
				snowball_instance.apply_impulse(Vector2(), direction * snowball_speed)
				get_tree().get_root().add_child(snowball_instance)
				snowball_amount -= 1
				if snowball_amount == 0:
					has_snowball = false
			else:
				print("No snowball made")
					 
# Pick up snowball with F key while in snowspot
func grab_snowball():
	animationState.travel("make_ball")
				
func grab_snowball_animation_finished():
	snowball_amount += 1
	has_snowball = true
	if Input.is_action_pressed("grab_snowball") and snowball_amount < max_snowball:
		grab_snowball()
	else:
		state = MOVE
	
# TODO: Implement dying animation
func death():
	if health == 0:
		self.queue_free()
		get_tree().reload_current_scene()
		








