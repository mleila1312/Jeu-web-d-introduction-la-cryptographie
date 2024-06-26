extends Node2D

var messages_list = []
var messages_cryptes = []
var code_list = []
var open = []
var tot = 0
var n = -1
var k = -1

func _ready():
	$Clés.hide()
	hide_jaunes()

func update_message_code(message, message_crypte, code):
	messages_list.append(message)
	messages_cryptes.append(message_crypte)
	code_list.append(code)
	open.append(false)
	tot = tot + 1
	update_case0()
	update_case1()
	update_case2()
	update_case3()
	update_case4()

func next_jaune():
	match k:
		0:
			$jaune0.hide()
			$jaune1.show()
		1:
			$jaune1.hide()
			$jaune2.show()
		2:
			$jaune2.hide()
			$jaune3.show()
		3:
			$jaune3.hide()
			$jaune4.show()
		4:
			$jaune4.hide()
			$affiche.text = ""
	if(k >= 0):
		k += 1
		

func update_case0():
	$Case0.text = "Message" + str(tot)
	
func update_case1():
	if(tot > 1):
		$Case1.text = "Message" + str(tot - 1)

func update_case2():
	if(tot > 2):
		$Case2.text = "Message" + str(tot - 2)
	
func update_case3():
	if(tot > 3):
		$Case3.text = "Message" + str(tot - 3)

func update_case4():
	if(tot > 4):
		$Case4.text = "Message" + str(tot - 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func hide_jaunes():
	$jaune0.hide()
	$jaune1.hide()
	$jaune2.hide()
	$jaune3.hide()
	$jaune4.hide()
	
func done_non_code():
	get_node("../progression").done_non_code_eve()
	
func done_code():
	get_node("../progression").done_code_eve()
	
func _on_button_0_pressed():
	n = tot - 1
	k = 0
	if(n >= 0):
		hide_jaunes()
		$jaune0.show()
		if(not code_list[n]):
			done_non_code()
			$affiche.text = messages_list[n]
		else:
			done_code()
			$affiche.text = messages_cryptes[n]
	
func _on_button_1_pressed():
	n = tot - 2
	k = 1
	if(n >= 0):
		hide_jaunes()
		$jaune1.show()
		if(not code_list[n]):
			done_non_code()
			$affiche.text = messages_list[n]
		else:
			done_code()
			$affiche.text = messages_cryptes[n]


func _on_button_2_pressed():
	n = tot - 3
	k = 2
	if(n >= 0):
		hide_jaunes()
		$jaune2.show()
		if(not code_list[n]):
			done_non_code()
			$affiche.text = messages_list[n]
		else:
			done_code()
			$affiche.text = messages_cryptes[n]


func _on_button_3_pressed():
	n = tot - 4
	k = 3
	if(n >= 0):
		hide_jaunes()
		$jaune3.show()
		if(not code_list[n]):
			done_non_code()
			$affiche.text = messages_list[n]
		else:
			done_code()
			$affiche.text = messages_cryptes[n]

func _on_button_4_pressed():
	n = tot - 5
	k = 4
	if(n >= 0):
		hide_jaunes()
		$jaune4.show()
		if(not code_list[n]):
			done_non_code()
			$affiche.text = messages_list[n]
		else:
			done_code()
			$affiche.text = messages_cryptes[n]


func _on_button_decrypter_pressed():
	$Clés.show()


func _on_sortie():
	$Clés.hide()


func _on_choix_publique_pressed():
	get_node("../Popups").montrer_eve_publique()


func _on_choix_privee_pressed():
	get_node("../Popups").montrer_eve_privée()
