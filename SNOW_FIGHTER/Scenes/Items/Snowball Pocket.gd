extends Area2D
var my_id = "snow_pocket"


func _on_Snowball_Pocket_body_entered(body):
	
	if body.name == "Player":
		
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0, -10), 0.25) 
		
		tween.tween_property(self,"modulate:a", 0.0, 0.5) 
		tween.tween_callback(self, 'queue_free')
