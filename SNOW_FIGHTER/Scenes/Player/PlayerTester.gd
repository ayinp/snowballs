extends KinematicBody2D
var my_id = "Player"

# player variables
export var speed = 80
export var accel = 8
export var friction = 9
var velocity = Vector2.ZERO
onready var animation = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

onready var snowflakes = 0
onready var jacket = false
onready var pocket = false
var health = 1

# snowball variables
export var snowball_speed = 250
var snowball = preload("res://Scenes/Snowball/Snowball.tscn")
var has_snowball = false
var max_snowball = 2
var snowball_amount = 0
onready var snowspot
var in_snowspot = false

var debug_mode = false

func snowbug():
	if Input.is_action_just_pressed("debug_mode"):
		debug_mode = true
		print("Debug mode: ", debug_mode)
	while debug_mode == true:
		has_snowball = true
		max_snowball = 10
		snowball_amount = 10
		break
		
# movement with W, A, S, D keys
# TODO: Reset animation to idle state when stopped. 
# FIXME: When a button is pressed quick, no animation plays.  
func wasd_move():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_direction = input_direction.normalized()
	
	if input_direction != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_direction)
		animationTree.set("parameters/walk/blend_position", input_direction)
		animationState.travel("walk")
		velocity = velocity.move_toward(input_direction * speed, accel)
	else:
		animationState.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("grab_snowball"):
	#in_snowspot and 
		#animationTree.set("parameters/idle/blend_position", input_direction)
		animationTree.set("parameters/make_ball/blend_position", input_direction)
		if not has_snowball:
			snowball_amount += 1
			animationState.travel("make_ball")
			has_snowball = true
			print(snowball_amount)
		elif Input.is_action_pressed("grab_snowball") and has_snowball:
				animationState.travel("make_ball")
				if snowball_amount < max_snowball:
					snowball_amount += 1
					print(snowball_amount)
				else:
					print("hands full")

# Aiming with Mouse Right Click
# FIXME: stutter at the end of the throw animation
# TODO: Sync animation with snowball throw point
func mouse_look():
	var node_ref = $"Snowball-Point"
	var pos_player = node_ref.get_global_position()
	var pos_mouse = get_global_mouse_position()
	var direction = (pos_mouse - pos_player).normalized()
	
	if Input.is_action_pressed("ui_accept"):
		animationTree.set("parameters/idle/blend_position", direction)
		animationTree.set("parameters/walk/blend_position", direction)
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
# TODO: Implement animation for making a snowball
func grab_snowball():
		var direction = $".".get_global_position()
		#animationTree.set("parameters/idle/blend_position", direction)
		#animationTree.set("parameters/walk/blend_position", direction)
		animationTree.set("parameters/make_ball/blend_position", direction)
		if in_snowspot and Input.is_action_just_pressed("grab_snowball"):
			if not has_snowball:
				animationState.travel("make_ball")
				has_snowball = true
				snowball_amount += 1
				print(snowball_amount)
			elif has_snowball:
				if snowball_amount < max_snowball:
					snowball_amount += 1
					print(snowball_amount)
				else:
					print("hands full")
					
# TODO: Implement dying animation
func death():
	if health == 0:
		self.queue_free()
		get_tree().reload_current_scene()
		
func _ready():
	print(snowball_amount)
	print(in_snowspot)
	
func _physics_process(_delta):
	wasd_move()
	mouse_look()
	grab_snowball()

func _process(_delta):
	death()
	snowbug()







