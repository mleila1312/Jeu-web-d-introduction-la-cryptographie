extends Node2D

# indique si le jeu a déjà été lancé
var lance =false 

# indique l'état du jeu
var state_decrypt=-1

# indique si le déchiffrement est fini
signal fin_jeu;

#indique l'ensemble des assiocation nombre-bouton pour faire de l'autofill
var associations = { 
	345: ['Button4', 'Button45', 'Button90', 'Button140', 'Button145', 'Button152'], 
	579: ['Button6', 'Button27', 'Button31', 'Button47', 'Button68'], 
	522: ['Button8', 'Button13', 'Button44', 'Button139'], 
	309: ['Button9', 'Button102', 'Button123'], 
	481: ['Button10', 'Button104', 'Button124'], 
	308: ['Button11', 'Button19', 'Button40', 'Button135', 'Button131'], 
	56: ['Button12', 'Button57', 'Button67', 'Button76', 'Button82', 'Button84', 'Button88', 'Button106', 'Button107', 'Button110', 'Button121', 'Button155'], 
	822: ['Button15', 'Button108', 'Button126', 'Button134'], 
	436: ['Button17', 'Button58', 'Button80'], 
	125: ['Button24', 'Button81', 'Button94'], 
	963: ['Button25', 'Button54', 'Button77'], 
	171: ['Button26', 'Button63', 'Button132', 'Button133'], 
	792: ['Button34', 'Button52', 'Button74'], 
	830: ['Button36', 'Button114', 'Button116'], 
	441: ['Button37', 'Button115', 'Button119'], 
	288: ['Button39', 'Button89', 'Button98'], 
	95: ['Button41', 'Button70', 'Button92', 'Button128', 'Button136'], 
	53: ['Button43', 'Button61', 'Button69', 'Button95', 'Button138'], 
	655: ['Button46', 'Button53', 'Button78', 'Button141'], 
	372: ['Button59', 'Button91', 'Button127'], 
	160: ['Button60', 'Button100', 'Button112'], 
	998: ['Button83', 'Button120', 'Button147'], 
	576: ['Button87', 'Button144', 'Button151'],
	478: ['Button103', 'Button130', 'Button142', 'Button149', 'Button157'], 
	826: ['Button62', 'Button122'], 
	45: [ 'Button143'], 
	47 : ['Button3'],
	211: ['Button146', 'Button153'], 
	804: ['Button148', 'Button156'], 
	896: ['Button5', 'Button20'], 
	163: ['Button7', 'Button118'], 
	122: ['Button14', 'Button109'], 
	10: ['Button22', 'Button65'], 
	300: ['Button64', 'Button117'], 
	547: ['Button71', 'Button129'], 
	766: ['Button75', 'Button105'], 
	939: ['Button51', 'Button73'], 
	22: ['Button55', 'Button96'], 
	274: ['Button42', 'Button137'], 
	52: ['Button32', 'Button72'], 
	634: ['Button16'], 
	396: ['Button18'], 
	753: ['Button21'], 
	713: ['Button23'], 
	386: ['Button28'], 
	986: ['Button29'], 
	229: ['Button30'], 
	842: ['Button33'], 
	761: ['Button35'], 
	248: ['Button38'], 
	427: ['Button48'], 
	701: ['Button49'], 
	819: ['Button50'], 
	589: ['Button56'], 
	314: ['Button66'], 
	446: ['Button79'], 
	124: ['Button85'], 
	350: ['Button86'], 
	336: ['Button93'], 
	509: ['Button97'], 
	231: ['Button99'], 
	330: ['Button101'], 
	326: ['Button111'], 
	756: ['Button113'], 
	246: ['Button125'], 
	23: ['Button150'], 
	623: ['Button1'], 
	605: ['Button2'],
	39: ['Button154']}

#indique les bonnes associations nombres-suite de lettres
var associations_correctes = {124: 'les', 22: 'en', 125: 'ne', 46: 'mi', 345: 's',
 226: 'veu', 10: 'le', 36: 'nt', 89: 'pas', 56: 'r', 12: 'dre', 45: '45', 78: 'x', 
95: 'la', 522: 're', 655: 'se', 21: 'des', 548: 'pri', 85: 'son', 54: 'ni', 326: 'er', 
754: 'temps', 52: 'et', 235: 'heu', 478: '.', 856: 'ont', 965: 'lle', 330: 'mas', 
309: 'que', 623: 'sa', 605: 'ma', 896: 'te', 579: 'de', 163: 'si', 481: 'vous', 
308: 'a', 122: 'ti', 822: 'ez', 634: 'im', 436: 'me', 396: 'di', 753: 'ment', 713: 'ge', 
963: 'ra', 171: 'l', 386: 'bu', 986: 'lo', 229: 'n', 842: 'qu', 792: 'il', 761: 'soit', 
830: 'c', 441: 'on', 248: 'dui', 288: 't', 274: 'fort', 53: 'e', 427: 'pi', 701: 'gne', 
819: 'rol', 939: 'ou', 589: 'fe', 372: 'dans', 160: 'un', 826: 'ce', 300: 'lu', 
314: 'ga', 547: 'nuit', 766: 'pou', 446: 'pro', 998: 'su', 350: 'rem', 576: 'pa', 
336: 'jour', 509: 'por', 231: 'ant', 756: 'e ', 246: 'fer', 949: ' a', 211: 'au', 
804: 'd', 23: '23', 39: 'no', 47: 'je'}
	
#indique les associations que le joueur à faites pour le moment
var current_assoc = { 
	47 : " ",
	345: " ",
	579: " ",
	522: " ", 
	309: " ",
	481: " ",
	308: " ",
	56: " ",
	822: " ",
	436: " ",
	125: " ",
	963: " ",
	171: " ",
	792:" ",
	830: " ",
	441: " ",
	288: " ",
	95: " ",
	53: " ",
	655: " ",
	372: " ",
	160: " ",
	998: " ",
	576: " ",
	478: " ",
	826: " ",
	45: " ",
	211: " ", 
	804: " ",
	896: " ",
	163: " ",
	122: " ",
	10: " ",
	300: " ",
	547: " ",
	766: " ",
	939: " ",
	22: " ",
	274: " ",
	52: " ",
	634: " ", 
	396: " ",
	753:" ",
	713: " ",
	386:" ",
	986: " ",
	229: " ",
	842: " ",
	761: " ",
	248: " ", 
	427: " ",
	701: " ",
	819: " ",
	589: " ",
	314: " ",
	446: " ",
	124: " ", 
	350: " ",
	336: " ",
	509: " ",
	231: " ",
	330: " ",
	326: " ",
	756: " ",
	246:" ",
	949: " ",
	23: " ",
	623: " ",
	605: " ",
	39: " "}

#variable qui contient la dernière syllabe que le joueur à sélectionner pour la placer
var cursed=" ";

#les autocomplete de base que l'on offre aux joueurs
var a_autocomplete = [47 , 623, 605, 634, 396, 753, 713, 386, 986, 229, 842, 761, 248, 427, 701, 819, 589, 314, 446, 124, 350, 336, 509, 231, 330, 326, 756, 246, 23, 39, 45, 896, 163, 122, 10, 52, 274, 939, 22, 826, 300, 547, 766, 211, 804]

#enregistre la syllabe du bouton cliqué
func send_syllable_str(elt):
	cursed = elt;
	
#fill les boutons ayant le même nombre que celui cliqué avec la dernière variable sélectionnée
func replace_str(nombre) :
	var labels= associations[nombre]
	for elt in labels : 
		get_node("ScrollContainer/Control/buttons/"+elt).text = cursed;
	current_assoc[nombre]= cursed;
	cursed = " "

# initialise le jeu de déchiffrement
func init_game2() :
	if lance==false: 
		get_parent().get_node("bg").texture=load("res://images/decryptage.png")
		#on ajoute certaines associations nombre-suite de lettres
		for i in a_autocomplete : 
			var labels= associations[i]
			cursed = associations_correctes[i]
			#on modifie les boutons correspondant et on les disable pour que le joueur ne puisse pas les modifier
			for elt in labels : 
				get_node("ScrollContainer/Control/buttons/"+elt).text = cursed;
				get_node("ScrollContainer/Control/buttons/"+elt).disabled=true;
			current_assoc[i]= cursed;
		#on change la couleur des boutons disabled pour qu'ils soient plus visibles
		for button in get_node("ScrollContainer/Control/buttons").get_children():
			button.set("theme_override_colors/font_disabled_color",Color(0, 0, 0, 1))
			button.set("theme_override_colors/icon_disabled_color",Color(1, 1, 1, 1))
		lance=true;

#désactive le node totalement pour éviter qu'il intéréagisse avec d'autres
func deactivate2():
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
#active complètement le node afin qu'il puisse interagir avec le node
func activate2():
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
	init_game2()


#lorsque le joueur soumet sa solution
func _on_submit_but_pressed():
	var check= true
	#vérifie que c'est bien la solution attendue
	for elt in current_assoc.keys():
		check = check && (current_assoc[elt] == associations_correctes[elt])
	if check : 
		#si c'est bon, on fige les boutons
		for button in get_node("ScrollContainer/Control/buttons").get_children():
			button.disabled=true
		#on indique un état post décryptage
		state_decrypt=0;
		#on montre l premier dialogue
		var dialogues= get_parent().get_parent().get_parent().get_node("Boite_dialogue");
		dialogues.show()
		dialogues.dialogue(-44)

#gère les inptut, ie, dans notre cas, lorsque le joueur clique quelque part. Cela permet d'afficher des nouveaux dilogues
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		var dialogues= get_parent().get_parent().get_parent().get_node("Boite_dialogue");
		if state_decrypt==0 : 
			dialogues.show()
			dialogues.dialogue(-45)
			state_decrypt+=1
			fin_jeu.emit()
