extends Label

var over = false;

func _ready():
	# Donne le focus au Label au démarrage
	grab_focus()
	# Active la gestion des événements d'entrée pour ce Label
	set_process_input(true)

func _input(event):
	if event is InputEventKey:
		# Vérifie si c'est une lettre alphabétique
		if event.pressed:
			var key_unicode = event.unicode
			if ((key_unicode >= 65 and key_unicode <= 90) or (key_unicode >= 97 and key_unicode <= 122)) and over:
				# Met à jour le texte du Label avec la lettre
				text = char(key_unicode);

func _on_control_mouse_entered():
	over = true;


func _on_control_mouse_exited():
	over = false;
