extends TextureRect

func montrer():
	self.show()
	$Timer.wait_time = 2
	$Timer.one_shot = true
	$Timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	self.hide()
