# Log W3 - IaC-Project
## [04/09 - 01/09]

### DayReport 28/08
Een eerste begin gemaakt van versie 1.0 van IaC project.
Begonnen met het creeeren van een module met daarin de inhoud voor het aanmaken van een Storage Account
Dit ging vrij aardig. Ik denk dat dit ook wel de minst complexe module zal zijn voor het project.


#### Obstacles
Niet echt. Veel opzoeken nog voor de juiste instellingen.
Informatie op vlak van Bicep (omdat het nog relatief nieuw is) is beperkt beschikbaar.

#### Solutions
N.V.T

#### Learnings
Nieuwe bronnen ontdekt.

-----------------------------------------------------------

### DayReport 29/08
Begonnen met network module. Alvast wat fundamenten neergezet.
Veel tests dmv 'what-if' commandos.
Ontdekkingen op vlak van bepaalde code-snippets die nut hebben voor het project.


#### Obstacles
Het netwerkdeel voor een beginnende engineer is nog best complex. De documentatie aangeboden door MS is niet altijd vanzelfsprekend.


#### Solutions
Op zoek naar andere bronnen die zaken wat simpeler aantonen.

#### Learnings
Nieuwe bronnen ontdekt.

-----------------------------------------------------------

### DayReport 30/08
Ontdekt dat JSON-files omgezet kunnen worden naar .bicep. Dit is vrij handig aangezien de documentatie op vlak van JSON veel ruimer is.
Verder deze dag alvast een beginnetje gemaakt voor de module Compute waar ik de VM met webserver en configuratie daarvan wil plaatsen.

#### Obstacles
De lijst aan errors begint nu wel te stijgen nu ik meer deployments uitprobeer.

#### Solutions
Af en toe even een pauzetje nemen of ergens anders aan werken om je 'mind' even te resetten

#### Learnings
Nieuwe bronnen ontdekt.
Nieuwe methode: JSON -> BICEP

-------------------------------------------------------------

### DayReport 31/08
Vandaag even een solution aangemaakt voor de dit project aan de hand van de portal interface van Azure (GUI).
Daarna de template daarvan geexporteerd naar mijzelf voor analyse. Dit geeft toch wel wat perspectief op mijn eigen code.
Verder alle modules een beetje gefixed/bijgewerkt. Maar nog steeds werk aan de winkel.

#### Obstacles
Sommige error messages vertalen zich niet direct naar een oplossing. Het vraagt soms meer trial/error dan gewenst.

#### Solutions
n.v.t.

#### Learnings
Op forums soms wat praktischere oplossingen ontdekt voor problemen waar ik tegen aanliep.

-----------------------------------------------------------------------------

### DayReport 01/09
Vandaag vooral beziggehouden met het corrigeren van mijn errors en wat schoonmaakwerk.

#### Obstacles
Ik liep al een tijdje tegen een probleem aan met outputs. Het lukte mij niet om mijn webserver te koppelen aan het netwerk module. 

#### Solutions
Problem lag schijnbaar bij verkeerde output gegevens. verkeerde notatie. Opgelost met hulp van mijn peer (Marcel).


#### Learnings
.

-------------------------------------------------------------------------------------