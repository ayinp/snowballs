extends Timer

func _ready():
	self.connect("timeout", $"..", "_on_timer_timeout")
