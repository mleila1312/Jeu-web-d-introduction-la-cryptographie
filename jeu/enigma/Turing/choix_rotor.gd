extends OptionButton

signal modif_label(lettre)
signal rotor_changed


signal rotor_moved
signal added_rotor
signal removed_rotor


var nb_rotation = 0


var is_ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Gère les zones grisées

var disabled1: int
var disabled2: int

func calcul_reciproque(l):
	if l == []:  return []
	var ll = []
	for i in range(1,27):
		for j in range(26):
			if l[j] == i:
				ll.append(j+1)
	return ll

func _disabled1(index):
	disabled1 = index
	update_rotor_choisi()
	
func _disabled2(index):
	disabled2 = index
	update_rotor_choisi()

func update_rotor_choisi():
	for i in range(6):
		set_item_disabled(i, false)
	if disabled1 != 0:
		set_item_disabled(disabled1, true)
	if disabled2 != 0:
		set_item_disabled(disabled2, true)


# Gère soi-même

var lettre = 0
var texte = ""


var rotor = []
var reciproque = []

const rotor1 = [3, 9, 26, 2, 22, 13, 4, 6, 19, 8, 17, 20, 5, 21, 15, 16, 14, 7, 10, 11, 24, 23, 25, 18, 12, 1]
const rotor2 = [25, 18, 11, 5, 19, 20, 8, 22, 24, 2, 1, 16, 23, 10, 4, 7, 26, 15, 6, 12, 17, 14, 3, 21, 9, 13]
const rotor3 = [16, 21, 17, 22, 26, 2, 6, 8, 12, 18, 20, 4, 24, 13, 23, 15, 10, 11, 9, 19, 7, 3, 5, 1, 14, 25]
const rotor4 = [19, 16, 5, 18, 1, 12, 3, 23, 6, 20, 9, 4, 11, 21, 25, 26, 14, 22, 13, 10, 7, 24, 2, 17, 15, 8]
const rotor5 = [20, 10, 11, 2, 18, 1, 4, 7, 26, 24, 16, 21, 15, 13, 19, 9, 5, 12, 6, 14, 3, 22, 8, 25, 23, 17]

const reciproque1 = [26, 4, 1, 7, 13, 8, 18, 10, 2, 19, 20, 25, 6, 17, 15, 16, 11, 24, 9, 12, 14, 5, 22, 21, 23, 3]
const reciproque2 = [11, 10, 23, 15, 4, 19, 16, 7, 25, 14, 3, 20, 26, 22, 18, 12, 21, 2, 5, 6, 24, 8, 13, 9, 1, 17]
const reciproque3 = [24, 6, 22, 12, 23, 7, 21, 8, 19, 17, 18, 9, 14, 25, 16, 1, 3, 10, 20, 11, 2, 4, 15, 13, 26, 5]
const reciproque4 = [5, 23, 7, 12, 3, 9, 21, 26, 11, 20, 13, 6, 19, 17, 25, 2, 24, 4, 1, 10, 14, 18, 8, 22, 15, 16]
const reciproque5 = [6, 4, 21, 7, 17, 19, 8, 23, 16, 2, 3, 18, 14, 20, 13, 11, 26, 5, 15, 1, 12, 22, 25, 10, 24, 9]

func reset_position():
	print("id ",get_selected_id())
	print("rotor avant reset", rotor)
	modif_rotor(get_selected_id())
	print("1 : ", rotor1)
	print("rotor après reset :", rotor)
	nb_rotation = 0
	rotor_moved.emit()

func modif_rotor(index):
	if index == 0:
		is_ready = false
		rotor = []
		reciproque = []
		texte = ""
		lettre = 0
		$Label.text = texte
		removed_rotor.emit()
	else:
		is_ready = true
		texte = "A"
		lettre = 1
		$Label.text = texte
		
	if index == 1:
		rotor = rotor1.duplicate()
		reciproque = reciproque1.duplicate()
		added_rotor.emit()
	if index == 2:
		rotor = rotor2.duplicate()
		reciproque = reciproque2.duplicate()
		added_rotor.emit()
	if index == 3:
		rotor = rotor3.duplicate()
		reciproque = reciproque3.duplicate()
		added_rotor.emit()
	if index == 4:
		rotor = rotor4.duplicate()
		reciproque = reciproque4.duplicate()
		added_rotor.emit()
	if index == 5:
		rotor = rotor5.duplicate()
		reciproque = reciproque5.duplicate()
		added_rotor.emit()
	nb_rotation = 0
	rotor_changed.emit()

func cypher_rotor(lettre):
	if rotor == []:
		return lettre
	else:
		return rotor[lettre-1]

func cypher_reciproque(lettre):
	if reciproque == []:
		return lettre
	else:
		return reciproque[lettre-1]

func update_affichage():
	$Label.text = int_to_string(lettre)
	

func int_to_string(lettre):
	return char(lettre + 64)


func rotate_rotor():
	if rotor == []:
		return
	lettre = (lettre % 26) + 1
	texte = int_to_string(lettre)
	print("ancien rotor ", rotor)
	if rotor != []:
		var a = rotor.pop_back()
		rotor.push_front(a)
	print("nouveau rotor ", rotor)
	reciproque = calcul_reciproque(rotor).duplicate()
	rotor_moved.emit()
	update_affichage() 


signal interne

func _on_up_pressed():
	if lettre != 0:
		if lettre == 1:
			lettre = 26
		else:
			lettre = lettre - 1
		texte = int_to_string(lettre)
		print("ancien rotor ", rotor)
		if rotor != []:
			var a = rotor.pop_front()
			rotor.push_back(a)
		print("nouveau rotor ", rotor)
		reciproque = calcul_reciproque(rotor).duplicate()
		interne.emit()
		rotor_moved.emit()
		update_affichage() 



func _on_down_pressed():
	if lettre != 0:
		lettre = (lettre % 26) + 1
		texte = int_to_string(lettre)
		print("ancien rotor ", rotor)
		if rotor != []:
			var a = rotor.pop_back()
			rotor.push_front(a)
		print("nouveau rotor ", rotor)
		reciproque = calcul_reciproque(rotor).duplicate()
		interne.emit()
		rotor_moved.emit()
		update_affichage() 



