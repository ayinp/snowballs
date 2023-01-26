extends Area2D



func _on_pickup_area_entered(area):
	if area.name == "Jacket":
		get_parent().jacket = true
		print("has jacket: ", get_parent().jacket)
	if area.name == "Snowball Pocket":
		get_parent().max_snowball = 3
		get_parent().pocket = true
		print("has pocket: ", get_parent().pocket)
	if area.is_in_group("snowflakes"):
		get_parent().snowflakes += 1
		print(get_parent().snowflakes)
	
