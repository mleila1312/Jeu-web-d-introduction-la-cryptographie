extends TextureRect


# Changement de background
func change_bg(image):
	self.texture = load ("res://images/"+ image);
