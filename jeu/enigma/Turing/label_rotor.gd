extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.DIM_GRAY
	add_theme_stylebox_override("normal", new_sb)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

