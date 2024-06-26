extends TextureRect

signal verify_file(file, outcome);

signal change_background;
var over =false;

var verified = [false, false, false, false];

func hover_button() : 
	over=true;
	
func unhover_button() : 
	over=false;

var over_file=[false, false, false, false, false, false, false]


func decision_hover():
	over_file[0]=true;
	
func decision_unhover():
	over_file[0]=false;

func doss1_hover():
	over_file[1]=true;
	
func doss1_unhover():
	over_file[1]=false;

func doss2_hover():
	over_file[2]=true;
	
func doss2_unhover():
	over_file[2]=false;

func doss3_hover():
	over_file[3]=true;
	
func doss3_unhover():
	over_file[3]=false;

func doss4_hover():
	over_file[4]=true;
	
func doss4_unhover():
	over_file[4]=false;

func doss5_hover():
	over_file[5]=true;
	
func doss5_unhover():
	over_file[5]=false;

func _ready():
	var doss=get_node("display_decision/dossier");
	var rais =get_node("display_decision/raison");
	doss.add_item("dossier 1");
	doss.add_item("dossier 2");
	doss.add_item("dossier 3");
	doss.add_item("dossier 4");
	
	rais.add_item("dossier validé");
	rais.add_item("données non sécurisées");
	rais.add_item("mauvaises informations");
	rais.add_item("mauvaise clé privée");
	rais.add_item("mot clé");
	pass # Replace with function body.

func verify() : 
	var files =get_node("display_decision/dossier");
	var file = get_node("display_decision/dossier").get_selected_id();
	var reason =get_node("display_decision/raison").get_selected_id();
	var keyword = get_node("display_decision/keyword").text;
	if file ==0 :
		if reason == 2 : 
			verify_file.emit(file, 2)
			files.set_item_disabled(file, true);
			verified[0]=true;
		else : 
			verify_file.emit(file, -1)
	elif file == 1  : 
		if reason == 0 : 
			verify_file.emit(file, 1)
			files.set_item_disabled(file, true);
			verified[1]=true;
		else : 
			verify_file.emit(file, -1)
	elif file == 2  : 
		if reason == 3 : 
			verify_file.emit(file, 2)
			files.set_item_disabled(file, true);
			verified[2]=true;
		else : 
			verify_file.emit(file, -1)
	elif file == 3  : 
		if reason == 1 : 
			verify_file.emit(file, 2)
			files.set_item_disabled(file, true);
			verified[3]=true;
		else : 
			verify_file.emit(file, -1)
	elif file == 4  : 
		if reason == 4 and keyword=="42" : 
			verify_file.emit(file, 2)
			files.set_item_disabled(file, true);
		else : 
			verify_file.emit(file, -1)
	if verified.all(func s(x) : return x) : 
		change_background.emit();
		
	
func text_dossier():
	var text_doss= get_node("infos_dossier");
	if over_file[1] :
		get_node("display_decision").hide();
		text_doss.show();
		text_doss.text = "Dossier 1 :\n
		Nom de l'entreprise : ARTISAMIEL\n
		Responsable légal de l'entreprise : Lyla Demange\n
		Adresse du responsable légal : 5 rue du ruisseau inversé, Galet-des-sous-Bois, Auvergne, 63023\n
		clé publique : MFswDQYJKoZIhvcNAQEBBQADSgAwRwJATACbdXIoAyam9a+pBgrvvLFOONbTJn9L
/rRXuk+9ZqhalG5Z0oP7k0N61qiYLQaMmbjf66fxfZKh1WOUf+XyHQIDAQAB\n
	url du site : http://127.0.0.1:4444/ArtisaMiel"
	if over_file[2] :
		get_node("display_decision").hide();
		text_doss.show();
		text_doss.text = "Dossier 2 :\n
		Nom de l'entreprise : ARTICHAUT\n
		Responsable légal de l'entreprise : Commité de Portection des Artichauts (CPA)\n
		Adresse du responsable légal : 19 Place Marguerite Perey, Palaiseau, 91120\n
		clé publique : MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAW0nJVD9a8tKzVGyfr7CYyuP0ZEtwREhh
0G3rN4qRtHxUXkDZPn06let/nBwPHDO2uF6x6WwHkHJa13LSXlNa2wIDAQAB\n
	url du site : http://127.0.0.1:4444/Artichaut"
	if over_file[3] :
		get_node("display_decision").hide();
		text_doss.show();
		text_doss.text =  "Dossier 3 :\n
		Nom de l'entreprise : HEADBAND\n
		Responsable légal de l'entreprise : InnovationTechFutur Inc.\n
		Adresse du responsable légal : 19 road of the Innovators, Sillicon Valley 2.0, 11560\n
		clé publique : MFswDQYJKoZIhvcNAQEBBQADS\n
	url du site : http://127.0.0.1:4444/Headband"
	if over_file[4]  :
		get_node("display_decision").hide();
		text_doss.show();
		text_doss.text = "Dossier 4 :\n
		Nom de l'entreprise : RANDOM\n
		Responsable légal de l'entreprise : Anon Inc\n
		Adresse du responsable légal : Sea of Tranquility, Moon\n
		clé publique : MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAeTxhIxe/1EGF9GhIQMMQOOb71Zxs8PlQ
XiHGq1za86tYVS1UAK3UIvQXGlT6gZLon0QyhjO/tXYEvEcUDy+SoQIDAQAB\n
		url du site : http://127.0.0.1:4444/Random"
	if over_file[5]  and verified.all(func s(x) : return x):
		get_node("display_decision").hide();
		text_doss.show();
		text_doss.text = "Dossier 5 :\n
		Nom de l'entreprise : LOGIN\n
		Responsable légal de l'entreprise : Commité de Protection des Artichauts (CPA)\n
		Adresse du responsable légal : 19 Place Marguerite Perey, Palaiseau, 91120\n
		clé publique : MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAZyClfJSKlv0KJNXUmMwb+I55UYpccLEn
05yOSE8Oy+eTx8EYzHGbGZHPdSiFd7blIILBRT7Eep4ty8yBJkhn7wIDAQAB\n
	url du site : http://127.0.0.1:4444/Login"
	if over_file[0] :
		text_doss.hide()
		get_node("display_decision").show();


	
func _input(event) : 
	var keyword=get_node("display_decision/keyword");
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and over == true :
		verify();
		keyword.text = ""

