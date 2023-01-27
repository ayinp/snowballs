extends KinematicBody2D

#enemy var
export var speed = 75
var velocity = Vector2.ZERO
onready var _animated_sprite = $AnimatedSprite
var see_player = false
var target
var can_throw = true
var delay = 2
export (int) var detect_radius
export (float) var fire_rate

#snowball var
export var snowball_speed = 250
var snowball = preload("res://Scenes/Enemies/Enemy Snowball.tscn")
var has_snowball = true
var max_snowball = 10
var snowball_amount = 10
onready var snowspot
var in_snowspot = false
var last_fire_time = 0


func _on_Visibility_body_entered(body):
	if body.name == "Player":
		see_player = true
		while see_player:
			if has_snowball:
				var current_time = OS.get_unix_time()
				if current_time - last_fire_time >= 1.0:
					var body_pos = body.get_global_position()
					var enemy_pos = self.get_global_position()
					var direction = (body_pos - enemy_pos).normalized()
					var snowball_instance = snowball.instance()
					snowball_instance.position = $"Snowball-Point".get_global_position()
					snowball_instance.apply_impulse(Vector2(), direction * snowball_speed)
					get_tree().get_root().call_deferred("add_child", snowball_instance)

					last_fire_time = current_time
					snowball_amount -= 1
					
				if snowball_amount == 0:
						has_snowball = false
						break
			if(is_inside_tree()):
				yield(get_tree(), "idle_frame")
			else:
				return
	else:
		see_player = false

func _on_Visibility_body_exited(_body):
	pass # Replace with function body.
