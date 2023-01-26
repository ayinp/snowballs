extends Area2D
var my_id = "jacket"




func _on_Jacket_body_entered(body):
	 
	if body.name == "Player":
		
		body.health += 1
		print('health: ', body.health)
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0, -10), 0.25) 
		
		tween.tween_property(self,"modulate:a", 0.0, 0.5) 
		tween.tween_callback(self, 'queue_free')
		

		
