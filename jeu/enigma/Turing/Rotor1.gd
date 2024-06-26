extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.DARK_GRAY
	add_theme_stylebox_override("normal", new_sb)



