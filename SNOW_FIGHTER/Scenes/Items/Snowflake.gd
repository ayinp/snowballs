extends Area2D



func _ready():
	add_to_group("snowflakes")
func _on_Snowflake_body_entered(body): 
	if body.name == "Player":
		
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0, -10), 0.25) 
		
		tween.tween_property(self,"modulate:a", 0.0, 0.5) 
		
		tween.tween_callback(self, 'queue_free')
		 
