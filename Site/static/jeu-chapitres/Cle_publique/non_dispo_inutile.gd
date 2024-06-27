extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func montrer():
	self.show()
	$Timer.wait_time = 4
	$Timer.one_shot = true
	$Timer.start()

func force_finish():
	$Timer.wait_time = 0

func _on_timer_timeout():
	self.hide()
