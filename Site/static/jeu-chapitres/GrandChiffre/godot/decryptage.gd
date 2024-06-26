extends Node2D

#indique si le message a bien été décrypté
signal finish_decrypt;

#indique l'état d'avancement dans le node qui nous intéresse
var state_decrypt=-1;

#indique si le déchiffrement à déjà été lancé
var lance= false;

#contient les associations boutons-nombres
var associations= {
	124 : ["Label", "Label16", "Label2", "Label52"],
	22 : ["Label4", "Label14", "Label36", "Label39", "Label44", "Label44"],
	125 : ["Label5", "Label8", "Label45", "Label48"],
	46 : ["Label6", "Label28", "Label46"],
	345 : ["Label7", "Label21", "Label35", "Label47", "Label57"],
	226 : ["Label9", "Label24"],
	89 : ["Label3","Label12", "Label49", "Label53"],
	56 : ["Label13", "Label51"],
	548 : ["Label17", "Label31"],
	54 : ["Label19", "Label33"],
	85 : ["Label18", "Label32"],
	326 : ["Label20", "Label34"],
	478 : ["Label22", "Label42", "Label58"], 
	522 : ["Label27", "Label41", "Label55"],
	655: ["Label29", "Label50", "Label54"],
	45 : ["Label23"],
	754 : [ "Label37"],
	78 : ["Label25"],
	235 : [ "Label40"],
	856 : [ "Label43"],
	21 : ["Label30"],
	52 :["Label38"],
	965 : ["Label56"],
	10 : ["Label10"],
	36 : ["Label11"],
	95 : ["Label26"],
	12: ["Label15"]
}

#contient la syllabe que le joueur souhaite placer
var cursed=" ";

#les nombre pour lesquels nous allons donner la solution
var a_autocomplete = [45,754,78,235,856,21,52,965,10,36,95,12, 85, 46]

#les associations nombre-lettres attendues
var associations_correctes ={
	124 :'les', 
	22 : 'en', 
	125 :'ne', 
	46 : 'mi', 
	345 : 's', 
	226 : 'veu', 
	10 : 'le', 
	36 : 'nt', 
	89 : 'pas', 
	56 : 'r', 
	12 : 'dre', 
	45 : 'je', 
	78 : 'x', 
	95 : 'la', 
	522 : 're', 
	655 : 'se', 
	21 : 'des', 
	548 : 'pri', 
	85 : 'son', 
	54 : 'ni', 
	326 : 'er', 
	754 : 'temps', 
	52 : 'et', 
	235 : 'heu', 
	478 : '.', 
	856: 'ont', 
	965 : 'lle'
}

#les association nombre-lettres que le joueur à fait
var current_assoc ={
	124 :" ", 
	22 : " ", 
	125 :" ", 
	46 : " ", 
	345 : " ", 
	226 : " ", 
	10 : " ", 
	36 : " ", 
	89 : " ", 
	56 : " ", 
	12 : " ", 
	45 : " ", 
	78 : " ", 
	95 : " ", 
	522 : " ", 
	655 : " ", 
	21 : " ", 
	548 :" ", 
	85 : " ", 
	54 : " ", 
	326 : " ", 
	754 : " ", 
	52 : " ", 
	235 : " ", 
	478 : " ", 
	856: " ", 
	965 : " "
}

#lorsque le joueur clique sur un bouton syllabe, on enregistre sur laquelle il a cliqué pour svaoir quelle syllabe placer ensuite dans le texte
func send_syllable(elt):
	cursed = elt;

#lorsque le joueur clique en dessous d'un nombre, on remplace cette case et toutes celles associées au même numéro par la velur choisie par le joueur
func replace(nombre) :
	var labels= associations[nombre]
	for elt in labels : 
		get_node("labels_txt/"+elt).text = cursed;
	current_assoc[nombre]= cursed;
	cursed = " "

#initialise le jeu de chiffrement
func init_game() :
	if lance==false:
		#si le jeu n'a jamais été lancé, on fait l'autocomplete 
		for i in a_autocomplete : 
			var labels= associations[i]
			cursed = associations_correctes[i]
			#on affiche le texte et on désactive les boutons pour ne pas perdre d'informations
			for elt in labels : 
				get_node("labels_txt/"+elt).text = cursed;
				get_node("labels_txt/"+elt).disabled=true;
			current_assoc[i]= cursed;
			#on change la couleur des boutons
		for button in $labels_txt.get_children():
			button.set("theme_override_colors/font_disabled_color",Color(0, 0, 0, 1))
			button.set("theme_override_colors/icon_disabled_color",Color(1, 1, 1, 1))
		cursed = " "
		lance=true;

#lorsque le joueur veut vérifier sa solution
func _on_submit_pressed():
	var check= true
	for elt in current_assoc.keys():
		check = check && (current_assoc[elt] == associations_correctes[elt])
	if check : 
		state_decrypt=0;
		
#gère les clickes et les affichages de dialogues en fonction du moment dans le jeu dans lequel est le joueur
func _input(event):
	var dialogues= get_parent().get_parent().get_node("Boite_dialogue")
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state_decrypt>=0 && state_decrypt<2 : 
			if state_decrypt==0 : 
				dialogues.show();
			dialogues.dialogue(-35-state_decrypt)
			state_decrypt+=1
		elif state_decrypt>=2 : 
			finish_decrypt.emit()
			
#empêche l'intéraction du node avec tous les signaux
func deactivate():
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)

#permet au node d'interéagir avec des signaux
func activate():
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
