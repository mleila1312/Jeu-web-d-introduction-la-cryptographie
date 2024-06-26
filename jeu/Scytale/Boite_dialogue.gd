extends CanvasLayer

@onready var i = 0
@onready var zoneTexte = $RichTextLabel


func _ready() :
	pass
	
var are_dialogues_launched = false

var dialogues ={
	0 : "[i][u]Messager :[/u][/i] Que... Quel est cet accoutrement..?",
	1 : "[i][u]Messager :[/u][/i] Ah c'est vous ! On m'a dit que je vous trouverais dans le coin.",
	2 : "[i][u]Vous :[/u][/i] ??? ",
	3 : "[i][u]Messager :[/u][/i] Regardez, j'ai trouvé ce petit papier étrange et collant qui m'a communiqué votre localisation.",
	4 : "[i][u]Vous :[/u][/i] Euh bonjour ? Où sommes-nous ?",
	5 : "[i][u]Messager :[/u][/i] On m'a dit qu'il faut que vous cherchiez dans vos poches. 
		D'ailleurs, prenez cette dague, ici c'est la guerre après tout",
	6 : "[i]*Vous retournez vos poches*[/i]",
	7 : "[i][u]Vous :[/u][/i] Ah ! J'ai quelque chose !",
	8 : "[i][u]Messager :[/u][/i] Ooh un message à décrypter ! Donnez-moi ça.",
	9 : "[i][u]Vous :[/u][/i]  Mais qu'est-ce que vous faites ?? Je ne comprends rien, quel est ce papier ? Et encore une fois, quand sommes-nous ???",
	10 : "[i][u]Messager :[/u][/i]  Je vois que vous n'êtes pas le plus cultivé des voyageurs. Ceci est une [b]scytale[/b]. C'est une méthode très poussée pour coder des messages ! Regardez, vous [b]enroulez[/b] un long morceau de cuir autour de la scytale, puis vous écrivez votre message dessus. Ensuite vous donnez le papier. Il faut alors avoir [b]la même taille[/b] de scytale pour lire le message.",
	11 : "[i][u]Messager :[/u][/i] Regardez, j'ai enroulé votre papier autour de ma scytale, mais on ne lit qu'un charabia... Vous allez devoir trouver une scytale d'une taille différente pour décoder votre message.",
	12 : "[i][u]Messager :[/u][/i] En attendant, voulez-vous essayer par vous-même ? Je n'ai pas de cuir en trop, mais si vous avez de quoi écrire, amusez-vous !",
	13 : "Shalala"
}
# Called when the node enters the scene tree for the first time.
func dialogue():
	#if are_dialogues_launched :
		zoneTexte.text = dialogues[i]
		i += 1
 #func _dialogues_launched() :
#	are_dialogues_launched = true

func ff_dialogue(a) :
	i = a;
	dialogue()
