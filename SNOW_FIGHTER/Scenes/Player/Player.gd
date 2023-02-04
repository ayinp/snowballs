extends KinematicBody2D
var my_id = "Player"
# player variables
export var speed = 75
var velocity = Vector2.ZERO
onready var _animated_sprite = $AnimatedSprite

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
var crouch = false

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
func wasd_move():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("move_right")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("move_left")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("move_up")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("move_down")
	else:
		_animated_sprite.stop()
		_animated_sprite.set_frame(1)
		
	velocity = move_and_slide(velocity.normalized() * speed)

# Aiming with Mouse Right Click
func mouse_look():
	var node_ref = $"Snowball-Point"
	var pos_player = node_ref.get_global_position()
	var pos_mouse = get_global_mouse_position()
	var _direction = (pos_mouse - pos_player).normalized()
	
	if Input.is_action_pressed("ui_accept"):
		if 0.7071 > _direction.x and _direction.x > -0.7071 and _direction.y > 0.7071:
			_animated_sprite.play("move_down")
		elif 0.7071 > _direction.x and _direction.x > -0.7071 and -0.7071 > _direction.y:
			_animated_sprite.play("move_up")
		elif -0.7071 > _direction.x and 0.7071 > _direction.y and _direction.y > -0.7071:
			_animated_sprite.play("move_left")
		elif _direction.x >= 0.7071 and 0.7071 > _direction.y and _direction.y > -0.7071:
			_animated_sprite.play("move_right")
		else:
			_animated_sprite.stop()
			_animated_sprite.set_frame(1)
			
		# Throw Snowball
		if Input.is_action_just_pressed("throw_projectile"):
			if has_snowball:
				var snowball_instance = snowball.instance()
				snowball_instance.position = pos_player
				snowball_instance.apply_impulse(Vector2(), _direction * snowball_speed)
				get_tree().get_root().add_child(snowball_instance)
				snowball_amount -= 1
				if snowball_amount == 0:
					has_snowball = false
			else:
				print("No snowball made")
					 
# Pick up snowball with F key while in snowspot
func grab_snowball():
		if in_snowspot and Input.is_action_just_pressed("grab_snowball"):
			if not has_snowball:
				has_snowball = true
				snowball_amount += 1
				print(snowball_amount)
			elif has_snowball:
				if snowball_amount < max_snowball:
					snowball_amount += 1
					print(snowball_amount)
				else:
					print("hands full")
					
func death():
	if health == 0:
		# stop game state
		# save enemies
		# play death animation 
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







