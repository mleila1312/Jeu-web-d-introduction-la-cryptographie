extends Node2D

@export var inventory: Inventory;

var state=0;
var dialogue = 0;

var enableClick = true;
var post_it_enabled = false;

var mapObtained = false;

signal espion_dialogue_on;
signal espion_dialogue_off;
signal turing_dialogue_on;
signal turing_dialogue_off;
signal activate_table;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boite_dialogue.hide();
	$Inv_UI.hide();
	get_node("display/phase1").set_zzz()
	
	$InvBig/PostIt.hide();
	$MotCroise.hide();
	$Batiment.hide();
	$Labyrinthe.hide();
	$InvBig/Map.hide();
	$Turing/WETTER.hide()
	$Turing/SolutionWETTER.hide()
	$Turing/InvWetter.hide()
	$Turing.hide();
	$TransitionFin.hide()
	

# pour gérer les states, avance quand on fait u click
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and enableClick:
		match state:
			0:
				await get_tree().create_timer(0.02).timeout;
				get_node("display/phase1").stop_beginning();
				$Boite_dialogue.show();
				$Inv_UI.show();
				$InvBig/PostIt.show();
				$Boite_dialogue.dialogue(dialogue);
			1:
				# phase du mot croisé
				enableClick = false
				await get_tree().create_timer(.5).timeout;
				$Inv_UI.hide();
				$Boite_dialogue.hide();
				$MotCroise.show();
			2:
				# transition entre le mot croisé et le labyrinthe
				# enableClick = true # activé par le labyrinthe
				$MotCroise.hide();
				$Boite_dialogue.show();
				$Batiment.show();
				state += 1;
			3: 
				# Labyrinthe
				enableClick = false
				await get_tree().create_timer(.2).timeout;
				$Boite_dialogue/text.text = "";
				$Batiment.hide();
				$Inv_UI.show();
				$Labyrinthe.show();
				await get_tree().create_timer(0.2).timeout;
			4:
				mapObtained = false
				await get_tree().create_timer(0.2).timeout;
				espion_dialogue_on.emit()
				$Boite_dialogue.dialogue(dialogue);
				state += 1;
				dialogue += 1;
				await get_tree().create_timer(0.2).timeout;
			5:
				await get_tree().create_timer(0.2).timeout;
				espion_dialogue_off.emit()
				turing_dialogue_on.emit()
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
				await get_tree().create_timer(0.2).timeout;
			6:
				emit_signal("turing_dialogue_off");
				$Boite_dialogue.dialogue(dialogue);
				state += 1;
				dialogue += 1;
			7: 
				emit_signal("turing_dialogue_on");
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			8:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			9:

				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			10:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			11:
				turing_dialogue_off.emit();
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			12:
				turing_dialogue_on.emit();
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			13:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
				activate_table.emit();
				post_it_enabled = true
				mapObtained = true
				enableClick = false
			14:
				$Turing.hide()
				$TransitionFin.show()
				$Boite_dialogue/text.text = "Ma tête est lourde. Je me sens transporté dans l'époque suivante."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);


# fais dispaitre le post it du milieu de l'écran
func _on_post_it_pressed():
	$InvBig/PostIt.hide();
	inventory.items[0] = preload("res://inventory/items/post_it.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	state += 1;
	dialogue += 1;
	if state == 1:
		$Boite_dialogue.dialogue(dialogue);

# quand on appuies sur le post it dans l'inventaire, affiche le post it
func _on_inv_post_it_pressed():
	if post_it_enabled:
		$InvBig/PostIt.show()
	

# quand le mot croisé est fini
func _on_mot_croise_mot_croise_fini():
	state += 1;
	dialogue += 1;
	$Boite_dialogue.dialogue(dialogue);
	enableClick = true


# quand on récupère la carte du labyrinthe
func _on_labyrinthe_map():
	inventory.items[1] = preload("res://inventory/items/map.tres");
	$Inv_UI.update_slots();
	mapObtained = true;
	$Boite_dialogue/text.text = "J'ai trouvé une carte. Elle m'aidera sûrement à trouver la sortie !"


# quand on va chercher l'argent et pas la carte
func _on_labyrinthe_tunnel():
	$Boite_dialogue/text.text = "N'est-tu intéressé que par l'argent !?"


# pour consulter la carte
func _on_inv_map_pressed():
	if mapObtained:
		$InvBig/Map.show();

# pour remettre la carte dans l'inventaire 
func _on_map_pressed():
	$InvBig/Map.hide();

# après s'être trompé de chemin dans le labyrinthe 
func _on_labyrinthe_perdu():
	$Boite_dialogue/text.text = "Mauvais chemin, j'ai été ramené au début. Je devrais peut-être regarder plus attentivement la carte."

# à la fin du labyrinthe, passe à la phase turing
func _on_labyrinthe_finished():
	# modifier state et dialogue i guess
	$Labyrinthe.hide();
	$Turing.show();
	state += 1;
	dialogue += 1;
	enableClick = true
	$Boite_dialogue/text.text = "OK, je suis enfin sorti de ce maudit labyrinthe... Où suis-je ? J'imagine que cet espion va enfin m'expliquer..."



# Pour afficher les aides demandées à Turing dans la phase Enigma

func _on_turing_aide_cables():
	$Boite_dialogue/text.text = "Le fonctionnement des connecteurs est très simple : tu as accès à trois connecteurs qui échangent deux lettres. Si A et B sont échangés et que tu appuies sur A, c'est B qui est envoyé dans les rotors, et inversement. \n Les connecteurs font également un échange après le second passage dans les rotors (si la lettre renvoyée par le second passage dans les rotors fait parties des lettres échangées). \n Ce mécanisme semble très simple mais est très puissants, car il y a énormément de combinaisons possibles."

func _on_turing_aide_generale():
	$Boite_dialogue/text.text = "Enigma est une machine complexe, mais s'en servir est plutôt simple. Il est possible de configurer des rotors et des connecteurs. \n Une fois dans une configuration, il suffit de taper son message sur le clavier. Les lettres qui s'allument forment alors le message codé. \n Pour décoder un message, il suffit de partir de la même configuration que celui qui a codé le message codé, et de taper le message codé sur la machine. Pour pouvoir décoder un message, il faut donc connaître la configuration dont est parti celui qui a tapé le message codé. \n Voici ce qui se passe dans la machine lorsque tu tappes sur une touche du clavier : la lettre est envoyée dans les connecteurs, puis dans les rotors, puis dans le réflecteur, puis à nouveau dans les rotors (mais dans l'autre sens, cette fois), et enfin à nouveau dans les connecteurs. La lettre renvoyée est la lettre codée, et la lumière correspondante s'allume."

func _on_turing_aide_reflecteur():
	$Boite_dialogue/text.text = "Le réflecteur est le composant le plus simple d'Enigma. Il reçoit une lettre du rotor de gauche, échange la lettre, et renvoie la lettre échangée dans le rotor de gauche. \n C'est grâce au réflecteur que rentrer un message codé dans Enigma en partant de la même configuration que celle qui a codé le message original permet d'obtenir le message original. Cependant, le réflecteur empêche une lettre d'être encodée en elle-même."

func _on_turing_aide_rotors():
	$Boite_dialogue/text.text = "Tu peux choisir, pour chaque emplacement, un rotor et sa position initiale. Le rotor est sélectionné dans chaque boîte sombre, et la position initiale est choisie par les flèches blanches. \n Chaque rotor transforme une lettre en une autre. Tu peux voir la table de transformation de chaque rotor en dessous de celui-ci. \n Après avoir reçu un message des connecteurs, le rotor de droite code la lettre reçue. Puis la lettre codée est envoyée dans le rotor du milieu, qui la code à son tour, qui est ensuite codée par le rotor de gauche. \n Après être passée dans le réflecteur, la lettre passe dans le rotor de gauche, puis celui du milieu, puis celui de droite, et est enfin renvoyée dans les connecteurs. Attention, sur le chemin du retour, les flèches sont à lire de droite à gauche. \n Par exemple, si il y a marqué A → B sous un rotor, cela signifique qu'il code A en B sur le chemin aller, et B en A sur le chemin du retour. \n Remaque que lorsque tu appuies sur une touche du clavier, le rotor de droite tourne. Une fois qu'il a fini un tour complet, le rotor du milieu tourne d'un cran, et ainsi de suite. Cela signifie que si tu appuies plusieurs fois sur une touche du clavier d'Enigma, la lettre renvoyée sera différente. C'est l'une des forces d'Enigma !"


const turing_on_enigma_main = "N'hésite pas à me demander des explications sur le fonctionnement de la machine, et expérimente avec autant que tu veux. Quand tu auras fini, on pourra passer à la suite."

func _on_turing_turing_when_enigma():
	#$Boite_dialogue/text.text = turing_on_enigma_main
	return

# pour que turing propose son aide
func _on_turing_enigma_main():
	$Boite_dialogue/text.text = turing_on_enigma_main

# lorsque le joueur choisit de passer à la suite de la phase enigma
func _on_turing_suite_enigma():
	$Boite_dialogue/text.text = "Bon, je te laisse décoder ce message, tu seras officiellement recruté si tu y arrives."
	$Turing/WETTER.show()
	$Turing/Enigma/Suite.hide()


# pour mettre dans l'inventaire le post it avec le code à déchiffrer
func _on_wetter_pressed():
	inventory.items[2] = preload("res://inventory/items/wetter.tres");
	$Inv_UI.update_slots();
	$Turing/SolutionWETTER.show()
	$Turing/WETTER.hide()
	$Turing/InvWetter.show()


# pour vérifier si le code trouvé est correct
func _on_solution_wetter_text_changed(new_text):
	if new_text.to_upper() == "WETTER":
		$Boite_dialogue/text.text = "Mais oui ! \"Wetter\" est le mot allemand pour \"météo\". Les allemands commencent toujours chaque jour par envoyer un rapport météo dont le premier mot est \"wetter\". On a donc une information sur le message. Grâce à cette information, et au fait qu'on sait qu'une lettre ne peux jamais être codée en elle-même, on peut construire une bombe, c'est-à-dire une machine qui permet de déduire la configuration utilisée pour chiffrer le message, et donc permet de décoder le rapport météo et les messages envoyés le même jour, qui sont codés avec la même configuration."
		await get_tree().create_timer(10).timeout
		enableClick = true

# pour afficher le post it avec le code à déchiffrer grâce à l'inventaire
func _on_inv_wetter_pressed():
	$Turing/WETTER.show()
