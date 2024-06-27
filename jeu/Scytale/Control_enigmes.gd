extends Node2D

@onready var message = ["A"]
@onready var defilement = 0
@onready var max_defilement = 1
@onready var first_time = true

# Called when the node enters the scene tree for the first time. 
func _ready():
	visible = false
	$bouton_defile.hide()
	$bouton_refile.hide()

func affiche_lettre(message, i) :
	if i >= len(message) : return " "
	else : return message[i]

func affiche_message():
	$case1.text = affiche_lettre(message, 0+defilement*8)
	$case2.text = affiche_lettre(message, 1+defilement*8)
	$case3.text = affiche_lettre(message, 2+defilement*8)
	$case4.text = affiche_lettre(message, 3+defilement*8)
	$case5.text = affiche_lettre(message, 4+defilement*8)
	$case6.text = affiche_lettre(message, 5+defilement*8)
	$case7.text = affiche_lettre(message, 6+defilement*8)
	$case8.text = affiche_lettre(message, 7+defilement*8)
	$case9.text = affiche_lettre(message, 8+defilement*8)
	$case10.text = affiche_lettre(message, 9+defilement*8)
	$case11.text = affiche_lettre(message, 10+defilement*8)
	$case12.text = affiche_lettre(message, 11+defilement*8)
	$case13.text = affiche_lettre(message, 12+defilement*8)
	$case14.text = affiche_lettre(message, 13+defilement*8)
	$case15.text = affiche_lettre(message, 14+defilement*8)
	$case16.text = affiche_lettre(message, 15+defilement*8)


func affiche_bon_message():
	if first_time :
		show()
		defilement = 0
		first_time = false
	message = ["L", "E", " ", "C", "O", "D", "E", " ", "A", " ", "R", "E", "N", "T", "R", "E", "R", " ", "D", "A", "N", "S", " ", "L", "A", " ", "M", "A", "C", "H", "I", "N", "E", " ", "E", "S", "T", " ", "D", "R", "A", "N", "A", "C"]
	max_defilement = max(ceil(max(len(message)-8, 0)/8), 0)
	$bouton_refile.hide()
	if max_defilement > 0 : $bouton_defile.show()
	affiche_message()
	
func affiche_mauvais_message():
	if first_time :
		show()
		defilement = 0
		first_time = false
	message = ["L", "A","R", "E", " ","C", " ", " "," ","R","L","H", "C","E", "D","O","A","N", "D","A", "T", " ", "E","R","N", " ", "M","E","S", "A"]
	max_defilement = max(ceil(max(len(message)-8, 0)/8), 0)
	$bouton_refile.hide()
	if max_defilement > 0 : $bouton_defile.show()
	affiche_message()
	

func _on_defilement():
	if defilement < max_defilement :
		defilement += 1
		if defilement == max_defilement : $bouton_defile.hide()
		if defilement > 0 : $bouton_refile.show()
	affiche_message()

func _on_refilement():
	if defilement > 0 :
		defilement -= 1
		if defilement < max_defilement : $bouton_defile.show()
		if defilement == 0 : $bouton_refile.hide()
	affiche_message()
