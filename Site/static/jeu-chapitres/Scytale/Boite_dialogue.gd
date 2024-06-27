extends CanvasLayer

@onready var i = 0
@onready var zoneTexte = $RichTextLabel


func _ready() :
	pass
	

var dialogues ={
	0 : "[i][u]Messager :[/u][/i] Que... Quel est cet accoutrement..?",
	1 : "[i][u]Messager :[/u][/i] Ah c'est vous ! On m'a dit que je vous trouverais dans le coin.",
	2 : "[i][u]Vous :[/u][/i] ??? ",
	3 : "[i][u]Messager :[/u][/i] Regardez, j'ai trouvé ce petit papier étrange et collant qui m'a communiqué votre localisation.",
	4 : "[i][u]Vous :[/u][/i] Euh bonjour ? Où sommes-nous ?",
	5 : "[i][u]Messager :[/u][/i] On m'a dit qu'il faut que vous fouilliez dans vos poches. 
		D'ailleurs, prenez cette dague, ici c'est la guerre après tout",
	6 : "[i]*Vous retournez vos poches*[/i]",
	7 : "[i][u]Vous :[/u][/i] Ah ! J'ai quelque chose !",
	8 : "[i][u]Messager :[/u][/i] Ooh un message à décrypter ! Donnez-moi ça.",
	9 : "[i][u]Vous :[/u][/i]  Mais qu'est-ce que vous faites ?? Je ne comprends rien, quel est ce papier ? Et encore une fois, quand sommes-nous ???",
	10 : "[i][u]Messager :[/u][/i]  Je vois que vous n'êtes pas le plus cultivé des voyageurs. Ceci est une [b]scytale[/b]. C'est une méthode très poussée pour coder des messages ! Regardez, vous [b]enroulez[/b] un long morceau de cuir autour de la scytale, puis vous écrivez votre message dessus. Ensuite vous donnez le papier. Il faut alors avoir [b]la même taille[/b] de scytale pour lire le message.",
	11 : "[i][u]Messager :[/u][/i] Regardez, j'ai enroulé votre papier autour de ma scytale, mais on ne lit qu'un charabia... Vous allez devoir trouver une scytale d'une taille différente pour décoder votre message. En attendant, gardez-le à portée de main !",
	12 : "[i][u]Messager :[/u][/i] En attendant, voulez-vous essayer d'utiliser une scytale par vous-même ? Je n'ai pas de cuir en trop, mais vous devriez réussir à trouver sur vous un ruban vierge où écrire !",
	13 : "[i][u]Messager :[/u][/i] Bien bien bien... Maintenant bon courage pour trouver la scytale qui vous convient !",
	14 : "[i][u]Messager :[/u][/i] Oh non, l'armée ennemie !! Elle... elle nous attaque ! Fuyez, ou nous serons faits prisonniers !",
	15 : "[i][u]Messager :[/u][/i] Nous sommes prisonniers maintenant... Comment allons-nous nous échapper ??",
	16 : "[i][u]Messager :[/u][/i] Merci beaucoup, voyageur ! Je pense en profiter pour fuir !",
	17 : '"Je vous souhaite bonne chance dans votre quête de scytales !"',
	18 : "Shalala"
}
# Called when the node enters the scene tree for the first time.
func dialogue():
	#if are_dialogues_launched :
		zoneTexte.text = dialogues[i]
		i += 1
 #func _dialogues_launched() :
#	are_dialogues_launched = true

func message(texte):
	zoneTexte.text = texte

func ff_dialogue(a) :
	i = a;
	dialogue()
