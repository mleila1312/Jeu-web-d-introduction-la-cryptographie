extends TextureRect


#permet de changer facilement l'image du background dans display
func change_bg(image):
	self.texture = load ("res://images/"+ image);
