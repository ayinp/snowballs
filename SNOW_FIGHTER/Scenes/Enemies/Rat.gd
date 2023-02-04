extends KinematicBody2D
#
var my_id = "rat"
var crouch = false
var in_cover = false
#var speed = 80
#var motion = Vector2(0,0)
##onready var p = $"../Player"
##onready var r = $"../Return"
##onready var rat = $"."
##var go = false
#
##func enemy2():
##	pass
#
#"""
#func _process(delta):
#
#	if 0.7071 > p.position.x and p.x > -0.7071 and motion.y > 0.7071:
#		#if velocity.length() != 0:
#		$"AnimatedSprite".play("Down")
#		#else:
#			#$"AnimatedSprite".play("Down_idle")
#			#print("Down")
#	elif 0.7071 > motion.x and motion.x > -0.7071 and -0.7071 > motion.y:
#		#if velocity.length() != 0:
#		$"AnimatedSprite".play("Up")
#		#else:
#			#$"AnimatedSprite".play("North_idle")
#			#print("Up")
#	elif -0.7071 > motion.x and 0.7071 > motion.y and motion.y > -0.7071:
#		#if velocity.length() != 0:
#		$"AnimatedSprite".play("Side")
#		#else:
#			#$"AnimatedSprite".play('Side_idle')
#			#print("Side")
#	elif motion.x > 0.7071 and 0.7071 > motion.y and motion.y > -0.7071:
#		#if velocity.length() != 0:
#		$"AnimatedSprite".play("Side")
#		#else:
#			#$"AnimatedSprite".play("Side_idle")
#			#print("Side_flipped")
#			"""
#
##func _physics_process(delta):
##	if go == true:
##		motion = position.direction_to(p.position) * speed
#
##	motion = move_and_slide(motion)
#
#
#
#
##func _on_Attackbox_body_entered(body):
##	if body.has_method('player'):
##		go = true
#
#
##func _on_escapebox_body_exited(body):
##	if body.has_method('player'):
##		go = false
#		#motion = position.direction_to(r.position) * speed
##		print('bye')
#
#
#
#
#
#
#
#func _on_Return_body_entered(body):
#	if body.has_method('enemy2'):
#		print('here')
#		motion = Vector2(0, 0)

		
