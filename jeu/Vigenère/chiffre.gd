extends Label

var over = false;

func _ready():
	# Donne le focus au Label au démarrage
	grab_focus()
	# Active la gestion des événements d'entrée pour ce Label
	set_process_input(true)

func _input(event):
	#if event is InputEventKey:
		## Vérifie si c'est une lettre alphabétique
		#if event.pressed:
			#var key_unicode = event.unicode
			#if (key_unicode >= 48) and (key_unicode <= 57) and over:
				## Met à jour le texte du Label avec la lettre
				#text = char(key_unicode);
	if event.is_pressed() and not event.is_echo():
		var key_text = event.as_text()
		if over and key_text in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] :
			text = key_text

func _on_control_mouse_entered():
	over = true;


func _on_control_mouse_exited():
	over = false;
