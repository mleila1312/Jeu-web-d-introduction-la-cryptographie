extends TextureRect

#vrai si on est au dessus du bouton de check d'identité
var over =false;

#si au dessus du bouton"
func hover_button() : 
	over=true;

#si on sort de la zone du bouton
func unhover_button() : 
	over=false;
	
#match le nom cherché entré à un résultat
func search() : 
	var searched = ($entry.text).to_upper();
	var infos = get_node("Scroll/infos");
	if searched =="ARTISAMIEL" : 
		infos.text="Responsable légal de l'entreprise : Rémy Artiller\n
		Adresse du responsable légal : 63 Avenue de la Révolution, Paris, 75006\n"
	elif searched== "ARTICHAUT" : 
		infos.text="Responsable légal de l'entreprise : Commité de Portection des Artichauts (CPA)\n
		Adresse du responsable légal : 19 Place Marguerite Perey, Palaiseau, 91120\n";
	elif searched == "HEADBAND" : 
		infos.text="Responsable légal de l'entreprise : InnovationTechFutur Inc.\n
		Adresse du responsable légal : 19 road of the Innovators, Sillicon Valley 2.0, 11560\n";
	elif searched == "RANDOM" : 
		infos.text="Responsable légal de l'entreprise : Anon Inc\n
		Adresse du responsable légal : Sea of Tranquility, Moon\n";
	elif searched== "LOGIN" : 
		infos.text="Responsable légal de l'entreprise : Commité de Protection des Artichauts (CPA)\n
		Adresse du responsable légal : 19 Place Marguerite Perey, Palaiseau, 91120\n";
	elif searched== "TELECOM PARIS" : 
		infos.text="Responsable légal de l'entreprise : Nicolas Glady\n
		Adresse du responsable légal : 19 Place Marguerite Perey, Palaiseau, 91120\n";
	elif searched== "KITTY CAT" : 
		infos.text="Responsable légal de l'entreprise : cats\n
		Adresse du responsable légal : partout. Ils sont partout.\n";
	elif searched== "CHAT" : 
		infos.text="Responsable légal de l'entreprise : chats\n
		Adresse du responsable légal : partout. Ils sont partout.\n";
	elif searched== "GOOGLE" : 
		infos.text="Responsable légal de l'entreprise : toi\n
		Adresse du responsable légal : ais-je réellement besoin de te le dire?\n";
	elif searched== "AMAZON" : 
		infos.text="Responsable légal de l'entreprise : Quick\n
		Adresse du responsable légal : 45 avenue Victor Hugo, Aubervillier, 93300\n";
	elif searched=="TEAPOT" or searched=="THE" : 
		infos.text="Error 418 : I'm a teapot"
	elif searched=="SLAY THE PRINCESS" : 
		infos.text="the tower, obviously"
	elif searched== "CAT" : 
		infos.text="Responsable légal de l'entreprise : Kitty cats\n
		Adresse du responsable légal : partout. Ils sont partout.\n";
	else : 
		infos.text ="Error 404 : not found"
		
#gère les clicks sur le bouton
func _input(event) : 
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and over == true :
		search();

# Called every frame. 'delta' is the elapsed time since the previous frame.
