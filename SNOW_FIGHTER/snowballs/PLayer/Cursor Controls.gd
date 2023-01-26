extends Node

var arrow = load("res://Circle.png")

func _input(event: InputEvent) -> void:		#tells the function to look at "'event'[s] -> 'InputEvent'[s]" and utilize any specified inputs that match these criteria in the following code
	
	if Input.is_action_just_released('ui_cancel'):	#if the input 'ui_cancel' is pressed and released the current mode the game is in will switch
		
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CONFINED: #compares current mouse mode to 'mouse_mode_confined', if they are the same then it switches to visible. else it reverts to confined
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

	#if event is InputEventMouseMotion: #Code to test whether or not mouse input is going through and where the mouse is in different mouse modes.
		#print(event.get_relative())
		#print(event.position)
	
func _ready() -> void:	#You must use this to initate simple shit, don't ask why... just do it
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_custom_mouse_cursor(arrow, Input.CURSOR_ARROW,Vector2(28,28))  # Set the cursor to the arrow shape

###	Next bit of functionality will be to revert the
