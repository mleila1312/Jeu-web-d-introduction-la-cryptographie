extends TextureRect


# Called when the node enters the scene tree for the first time.
func change_bg(image):
	self.texture = load ("res://images/"+ image);
