extends Control

signal map
signal tunnel
signal perdu
signal finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$Round2.hide();
	$Round3.hide();
	$Round4.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# informe main que le joueur s'est trompé de chemin
func _on_button_pressed():
	emit_signal("tunnel");


func _on_button_2_pressed():
	emit_signal("tunnel");

# informe le main que le joueur a trouvé la carte
func _on_button_3_pressed():
	emit_signal("map");
	$Round1.hide();
	$Round2.show();

# bon chemin
func _on_button_feu_1_pressed():
	$Round2.hide();
	$Round3.show();

# mauvais chemin
func _on_button_eau_1_pressed():
	emit_signal("perdu");

# mauvais chemin
func _on_button_foudre_1_pressed():
	emit_signal("perdu");


# bon chemin
func _on_button_eau_2_pressed():
	$Round3.hide();
	$Round4.show();

# mauvais chemin
func _on_button_feu_2_pressed():
	emit_signal("perdu");
	$Round3.hide();
	$Round2.show();

# mauvais chemin
func _on_button_foudre_2_pressed():
	emit_signal("perdu");
	$Round3.hide();
	$Round2.show();

# mauvais chemin
func _on_button_feu_3_pressed():
	emit_signal("perdu");
	$Round4.hide();
	$Round2.show();

# bon chemin -> labyrinthe fini
func _on_button_foudre_3_pressed():
	emit_signal("finished");

# mauvais chemin
func _on_button_eau_3_pressed():
	emit_signal("perdu");
	$Round4.hide();
	$Round2.show();
