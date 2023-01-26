extends KinematicBody2D
const speed = 200

	
func _process(delta):	#process makes it so a function is called every frame while the node is active, delta is elapsed time since last frame
	var velocity = Vector2.ZERO		#'vector2' represents a 2d vector, '.zero' makes the vector equal zero after each pass through the loop effectively stopping the character without held input
	if Input.is_key_pressed(KEY_A):		#if Input.is_key_pressed(KEY_') checks if key is pressed
		velocity.x -= 1
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	move_and_slide(velocity.normalized() * speed) #kinematic body node exclusive method that is used to move a physics body and handle collisions. frequently used with 'func _physics_process(delta):...'
												  #velocity vector from inputs is normalized and multiplied by speed constant established at the top of the page
	#player_animation(velocity)extends KinematicBody2D
	#var node_ref = Player
	var node_ref = get_node("/root/Main/Player")
	var pos_player = node_ref.get_position()
	var pos_mouse = get_global_mouse_position()
	#var angle = pos_player.angle_to(pos_mouse)
	#var angle_deg = radians_to_degrees(angle)
	var direction = pos_player.direction_to(pos_mouse)
	#print(angle)
	#print(angle_deg)
	print(direction)
#var controls = InputMap.new()
#	controls.action_add_event("ui_left", InputEventKey.new('KEY_A'))
#	controls.action_add_event("ui_right", InputEventKey.new('KEY_D'))
#	controls.action_add_event("ui_up", InputEventKey.new('KEY_W)')
#	controls.action_add_event("ui_down", InputEventKey.new('KEY_S'))
