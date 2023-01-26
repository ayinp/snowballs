extends YSort

onready var player = $Player
onready var wall = $Walls/WallHitBox/WallCollision
#var player_pos = player.get_position()
#var wall_pos = wall.get_position()

func _process(_delta):
	var player_pos = player.get_global_position()
	var wall_pos = wall.get_global_position()
	
	if player_pos.y > wall_pos.y - 3:
		set_sort_enabled(false)
	elif player_pos.y < wall_pos.y:
		set_sort_enabled(true)
		#print("above wall")
