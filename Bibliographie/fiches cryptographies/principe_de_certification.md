# Principe de certification

<center>
<img src="https://cyber.gouv.fr/sites/default/files/image/enisa-infographic.png" width = "350"/>
<img src="https://cyber.gouv.fr/sites/default/files/2022-10/etapes-certification-produit.png" width = "350"/>
</center>

Source : https://cyber.gouv.fr/comprendre-la-certification 
Source : https://fr.wikipedia.org/wiki/Certificat_%C3%A9lectronique 
Source : https://pha.ants.gouv.fr/files/b07541f3-bc9b-4e07-b6ea-d245a972aba5/installation-certificat-numerique_1.pdf
Source : https://www.globalsign.com/en-sg/blog/history-internet-development-pki

## Explication
La certification est l’attestation de la robustesse d’un produit, basée sur une analyse de conformité et des tests de pénétration réalisés par un évaluateur tiers sous l’autorité de l’ANSSI, selon un schéma et un référentiel adaptés aux besoins de sécurité des utilisateurs et tenant compte des évolutions technologiques.

## Idée d'implémentation
Tu es un agent de l'ANSSI qui doit certifier (ou non) plusieurs systèmes. Pour cela tu dois essayer de les infecter (branche qqch dessus) et si la manoeuvre réussit, ça échoue. Cependant tu ne peux pas utiliser les mêmes branchements sur tous les systèmes (code couleur) : à toi d'être le plus rapide pour mettre les bonnes infections sur les bons systèmes (tapis roulant qui va de plus en plus vite)

# Qu'est-ce qu'un certificat, pourquoi les utiliser ?
Un certificat permet de vérifier l'identité d'une personne, d'une entité. C'est une forme de signature numérique. Pour obtenir un certificat, une entité doit le demander à une autorité de certification. le certificat donné par cette autorité est valable uniquement si l'on considère que c'est une autorité de confiance : il appartient donc au receveur du certificat, si il fait confiance à cette autorité, d'accepter cette validation d'identité.  En France, un certificat numérique est délivré par un organisme agréé par le ministère chargé des finances.

On peut avoir besoin d'un certificat dans le cas de transmission de clé publique. Si celle-ci n'est pas sécurisée, un attaquant peut se positionner entre l'entité et son public en diffusant de fausses clés publiques (par le biais d'un faux site web par exemple) puis intercepter toutes les communications, lui permettant d'usurper l'identité du diffuseur de clés publique et de créer une attaque de l'homme du milieu.  

Dans un cadre fermé et relativement restreint (entreprise, service public…) la diffusion de clés sécurisées est relativement simple et peut prendre de nombreuses formes, mais quand le diffuseur souhaite s'adresser à un public plus large avec lequel il n'a pas eu de contact préalable (grand public, public international) elle nécessite un cadre normalisé.

Les certificats résolvent le problème du canal sécurisé grâce à la signature de tiers de confiance.

# Que contient le certificat et comment l'obtenir?
Pour qu'une autorité de certification procure un certificat à une entité, l'entité (site web,...) doit fournir à cette autorité plusieurs éléments, dont :
+ Sa clé publique : l'autorité de certification doit vérifier si l'entité possède bien la clé privée, pour cela, elle lui enverra un challenge chiffré que l'entité devra lui renvoyer décrypté
+ l'url du site web demandant le certificat
+ un moyen de vérifier l'identité de l'entreprise : cela peut se faire en fournissant des informations sur le responsable légal, des documents commerciaux ou autres.
Ce sont les 3 éléments majeurs. L'autorité peut également cependant demander d'autres informations en fonction.  
Le certificat une fois validé contient plusieurs informations, comme la clé publique du détenteur du certificat, sa durée de validité... Il est envoyé à une autre entité accompagnée d'une signature (calculée à partir de la clé privée) chiffré avec la clé publique de l'entité qui doit la recevoir. Pour vérifier l'identité de l'envoyeur, le receveur dit vérifier la validité du certificat puis celle de la signature.

# Bref historique des certificats
Dans les années 70, la British Intellagence Agency inventa l'infrastructure à clé publique. En 90, ces découvertes furent ontrées au public, étant donnée que le nombr de communication électronique grandissiat, il était devenu nécessaire de trouver un moyen de sécuriser les informations échangées.  
En 1994, Taher Elgama et Netscape ont développé l'un des ppremier certificat : le Secure Socket Layer (SSL)/ Transport Security Layer (TSL), aussi manifeste à travers le https.  
En 1996, GlobalSign a été fondé en Belgique, c'est l'un des fondateurs de l'industrie de l'infrastructure à clés publiques et est une autorité de certification reconnue.