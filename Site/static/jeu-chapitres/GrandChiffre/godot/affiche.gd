extends Node2D


signal retour;

#montre l'affiche avec l'indication des mélanges à faire pour faire fonctionner la machine
func _on_button_pressed():
	retour.emit();
