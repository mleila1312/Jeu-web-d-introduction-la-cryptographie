extends TextureRect

#sile joueur a accès au dossier 5
var activated_5 = false

#si tout a été résolu
signal all_seen

#donne la possibilité de regarder le dossier 5
func authorize5() :
	if not activated_5:
		$OptionButton.add_item("dossier 5");
		activated_5 = true;
		get_parent().get_node("decision/display_decision/dossier").add_item("dossier 5");;

var over =false;
# Called when the node enters the scene tree for the first time.

func hover_button() : 
	over=true;
	
func unhover_button() : 
	over=false;
	

# génère le menu déroulannt
func _ready():
	$OptionButton.add_item("dossier 1");
	$OptionButton.add_item("dossier 2");
	$OptionButton.add_item("dossier 3");
	$OptionButton.add_item("dossier 4");
	pass # Replace with function body.


#envoie le challenge  chiffré et renvoie laréponsedu serveur
func send(): 
	var crypted_text = $entry.text;
	var file = $OptionButton.get_selected_id();
	if file == 0 : 
		$retour.text = "sécurité de la clé : 10/10\n
		retour du site : "+ crypted_text;
	elif file ==1 :
		$retour.text = "sécurité de la clé : 10/10\n
		retour du site : "+ crypted_text;
	elif file ==2 :
		$retour.text = "sécurité de la clé : 10/10\n
		retour du site : 23135QMNKomgifj.JFuujblVJLQD6678731438766gj_éçhxé&àxjà";
	elif file ==3 :
		$retour.text = "sécurité de la clé : 5/10\n
		retour du site : "+ crypted_text;
	else :
		if crypted_text=="SERVEUR" :
			$retour.text = "sécurité de la clé : 10/10\n
			retour du site : RÉPONSE= 19";
		else : 
			$retour.text = "sécurité de la clé : 10/10\n
			retour du site : "+ crypted_text;


func _input(event) : 
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and over == true :
		send();
		$entry.text = ""
	
