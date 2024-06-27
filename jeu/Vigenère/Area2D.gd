extends Area2D

# Fonction de gestion du signal input_event

# func _on_input_event(viewport, event, shape_idx):
	# if event is InputEventMouseButton and event.pressed:
		# var clicked_shape = get_overlapping_areas()[0] # Assumant que vous n'avez qu'un seul shape en surbrillance
		# if clicked_shape == $CollisionShape2D:
			# print("Collision Shape 2D cliqué!")
		   #  _show_zoomed_view()

# Fonction pour afficher la vue zoomée de la machine à écrire
func _show_zoomed_view():
	print("Afficher la machine à écrire zoomée")
	$machineATaperZoom.show()
	$LivreOuvert.hide()


	



