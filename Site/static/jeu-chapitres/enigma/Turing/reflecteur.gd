extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# la table de transformation du réflecteur
const reflexion = [22,20,14,8,21,17,26,4,10,9,23,24,16,3,25,13,6,19,18,2,5,1,11,12,15,7]

# calcule le code d'une lettre par le réflecteur 
func reflexion_cypher(lettre):
	return reflexion[lettre-1]

signal retour

# signale à enigma que le joueur veut revenir sur le clavier
func _on_button_pressed():
	retour.emit()


signal aide_reflecteur

# signale à enigma que le joueur demande une explication
func _on_aide_reflecteur_pressed():
	aide_reflecteur.emit()
