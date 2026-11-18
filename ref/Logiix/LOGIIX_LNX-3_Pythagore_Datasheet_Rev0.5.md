---
title: "Logiix LNX-3 Pythagore — Datasheet"
subtitle: "Transcription de la révision 0.5"
date: "2026-11-16"
lang: fr-CA
---

> **Statut :** Document conceptuel, non validé en silicium. Transcription du PDF original; les tableaux sont conservés en blocs préformatés pour éviter de déformer les valeurs et alignements.

## Page 1

```text
LNX-3
PYTHAGORE
ULTRACALCULATEUR
IA, AGI expérimentale, HPC et simulation 3D




38                                       760                              418
CHIPLETS CPL3A                           COMPUTE UNITS                    PFLOPS MXFP4*




Vortex HPC · Architecture ARM Logiix · HBM4

Fabric haute vitesse · Refroidissement liquide




    DATA SHEET / CONCEPT ENGINEERING

    Révision 0.5 · 16 novembre 2026 · Horizon 2028

    Statut : architecture ciblée, non fabriquée ni certifiée




* Performance crête théorique calculée à partir des objectifs par Unit.
Aucune mesure silicium; aucune garantie de disponibilité ou de prix.
```

## Page 2

```text
LNX-3 PYTHAGORE / 01


Vue générale du produit
Plateforme hétérogène de recherche, d’entraînement IA et de calcul scientifique. Architecture cible, non
disponible commercialement.




  38                              760                                 418 PF                        5,856 To
  CHIPLETS CPL3A                  COMPUTE UNITS                       MXFP4 CRÊTE                   HBM4 INSTALLÉE




LNX-3 Pythagore regroupe une matrice de calcul IA distribuée de 38 chiplets CPL3A et une zone Vortex HPC de calcul
vectoriel, scientifique, physique et graphique. Son architecture hôte repose sur des cœurs ARM personnalisés Logiix
de classes performance et efficacité.

 Paramètre                     Spécification de référence                                              Statut


 Génération / lancement        LNX-3 / horizon 2028                                                    Cible


 Procédé de gravure            Intel 12A Custom                                                        Hypothèse de scénario


 Accélération IA               38 × CPL3A ; 20 Units par CPL3A                                         Définition retenue


 Zone polyvalente              Vortex HPC, ≈ surface de 16 CPL3A                                       Enveloppe conceptuelle


 CPU hôte                      ARM Logiix custom : performance + efficacité                            Architecture retenue ;
                                                                                                       dimensionnement à venir


 Mémoire installée             122 × HBM4 48 Go = 5 856 Go                                             Configuration physique
                                                                                                       proposée


 Puissance système             35 kW hors infrastructure de site                                       Budget provisoire, non
                                                                                                       mesuré


 Refroidissement               Liquide direct-to-chip ; châssis multi-modules                          Préconisation à valider




     Statut du document

     Une « spécification retenue » est une décision du projet Logiix. Une « cible » est une exigence d’ingénierie non
     validée. Les résultats chiffrés sont des calculs théoriques, pas des benchmarks ni des caractéristiques d’un produit
     fabriqué.
```

## Page 3

```text
LNX-3 PYTHAGORE / 02


Topologie système
Architecture logique, indépendamment du choix final du nombre de packages et de substrats.



                                              LOGIIX ARM CUSTOM CPU

                                           Cœurs performance + efficacité · control plane




                                             DYNAMIC COMPUTE MANAGER
                                           Ordonnancement, énergie, isolation, migration




                      38 × CPL3A                                                            VORTEX HPC




               760 Compute Units · IA adaptative                                     GPGPU · FP64 · simulation · 3D




                                                   LNX FABRIC 3 + HBM4


                                         Interconnexion multi-package et espaces mémoire



Les 38 CPL3A forment la matrice d’accélération IA. La zone Vortex HPC n’est pas une troisième matrice de 16
CPL3A : sa surface fonctionnelle cible équivaut à celle de 16 CPL3A, mais elle contient des moteurs spécialisés
différents. Les CPU ARM coordonnent l’exécution et exposent les services système.

La partition physique des 38 chiplets (par exemple groupes locaux interconnectés), la hiérarchie de cohérence, le
nombre de packages et l’emplacement des contrôleurs HBM restent ouverts. Le volume élevé de mémoire implique
une approche multi-package ou multi-module plutôt qu’un die monolithique.


     Enveloppe de surface logique

     38 CPL3A physiques + Vortex HPC ≈ 16 équivalents CPL3A de surface = 54 équivalents CPL3A, avant CPU, mémoire,
     PHY, I/O et packaging. Aucun chiffre en mm² n’est encore justifié.
```

## Page 4

```text
LNX-3 PYTHAGORE / 03


Microarchitecture CPL3A
La Compute Unit est un cluster interne de calcul, distinct du chiplet CPL3A.

Chaque CPL3A contient 20 Compute Units. Le même modèle d’Unit est utilisé dans les déclinaisons CPL3B/C/D/E,
avec un nombre d’Units différent. L’objectif premier de Pythagore demeure la performance par watt plutôt que la
fréquence maximale.

 Bloc d’une Compute Unit               Fonction prévue                                                       Définition


 Matrix Engine                         MXFP4, FP8, BF16/FP16 ; multiplication matricielle                    Cible


 Transformer / Attention               Attention, projections, cache KV, décodage                            Architecture retenue


 Sparse / MoE                          Calculs creux, routage des experts                                    Architecture retenue


 Vector / Scalar                       FP32, FP64 de contrôle ; opérations auxiliaires                       Architecture retenue


 RISC-V microcontrôle                  Dispatch local, synchronisation, monitoring                           Option à valider


 SRAM locale                           32 Mio / Unit                                                         Objectif retenu


 SRAM 3D                               100 Mio / Unit alloués                                                Objectif retenu


 Mémoire externe                       Allocation logique min. 2 / nominale 5,6 / max. 9,6 Go / Unit         Modèle de capacité



La SRAM est répartie en banques proches des moteurs et un étage 3D alloué à chaque Unit. Le cache 3D peut être physiquement
distribué ou partagé avec garantie de quota, à condition d’atteindre les latences et la bande passante requises. Les détails du
protocole de cohérence et des portes de rétention restent à définir.


     Hypothèse de structure

     Les TFLOPS par Unit sont calculés comme des plafonds mathématiques. Les nombres de MAC, la fréquence cible, le
     rapport d’utilisation des unités, la précision des accumulateurs et le mode dense/sparse ne sont pas encore spécifiés.
```

## Page 5

```text
LNX-3 PYTHAGORE / 04


Performances de calcul théoriques
Agrégation de 760 Units CPL3A. Les moteurs Vortex HPC ne sont pas inclus dans ces chiffres.


 Format                        Par Unit                      Par CPL3A (20 Units)            Pythagore (760 Units)


 MXFP4                         550 TFLOPS                    11 PFLOPS                       418 PFLOPS


 FP8                           275 TFLOPS                    5,5 PFLOPS                      209 PFLOPS


 BF16 / FP16                   137,5 TFLOPS                  2,75 PFLOPS                     104,5 PFLOPS


 TF32                          68,75 TFLOPS                  1,375 PFLOPS                    52,25 PFLOPS


 FP32                          4 TFLOPS                      80 TFLOPS                       3,04 PFLOPS


 FP64                          0,25 TFLOPS                   5 TFLOPS                        190 TFLOPS




MXFP4                                                                                                                  418 PFLOPS



FP8                                                                                                                    209 PFLOPS



BF16 / FP16                                                                                                           104.5 PFLOPS



TF32                                                                                                                  52.25 PFLOPS



FP32                                                                                                                   3.04 PFLOPS



FP64                                                                                                                   190 TFLOPS
Echelle des barres : PFLOPS; valeurs crête agrégées non mesurées.

       Conditions de mesure non établies

       Ces débits ne sont pas simultanément additionnables. La densité utile, les opérations FMA comptées à deux
       opérations, le mode dense ou sparse, les horloges et la précision numérique doivent être définis avant toute
       comparaison externe. La performance soutenue peut être très inférieure à la crête.
```

## Page 6

```text
LNX-3 PYTHAGORE / 05


Hiérarchie mémoire
SRAM locale + SRAM 3D + HBM4 installée ; trois niveaux distincts de capacité.




              UNIT (×760)                              CPL3A (×38)                                   SYSTÈME



             32 Mio SRAM locale                      640 Mio SRAM locale                        23,75 Gio SRAM locale




             100 Mio SRAM 3D                          2 000 Mio SRAM 3D                           74,22 Gio SRAM 3D




 Périmètre                          SRAM locale                      SRAM 3D                         Total SRAM


 1 Compute Unit                     32 Mio                           100 Mio                         132 Mio


 1 CPL3A (20 Units)                 640 Mio                          2 000 Mio                       2 640 Mio


 38 CPL3A / 760 Units               24 320 Mio = 23,75 Gio           76 000 Mio = 74,22 Gio          100 320 Mio = 97,97 Gio


HBM4 de référence : 3 piles de 48 Go par CPL3A (114 piles ; 5 472 Go pour les CPL3A) + 8 piles de 48 Go allouées
à Vortex HPC (384 Go), soit 122 piles et 5 856 Go = 5,856 To installés. Ces capacités ne sont pas intégrées dans
le total SRAM.

 Calcul de capacité / débit                         Valeur                             Interprétation


 RAM logique nominale CPL3A                         760 × 5,6 Go = 4 256 Go            Budget d’allocation par Unit


 RAM logique max. CPL3A                             760 × 9,6 Go = 7 296 Go            Non atteinte par la configuration HBM4
                                                                                       proposée


 Bande passante HBM4 nominale théorique             122 × 2,8 To/s ≈ 341,6 To/s        Somme des liens de piles, non débit
                                                                                       global soutenu



     Contrainte de faisabilité majeure

     122 empilements HBM4 constituent une configuration extrêmement ambitieuse et exigent plusieurs
     packages/modules, des PHY mémoire nombreux, une surface d’interposeurs importante et une étude rigoureuse
     d’alimentation et de rendement. Le débit par pile et la capacité de 48 Go sont des références technologiques, pas un
     contrat d’approvisionnement.
```

## Page 7

```text
LNX-3 PYTHAGORE / 06


Vortex HPC — Calcul général et scientifique
Sous-système indépendant de la matrice IA ; surface conceptuelle ≈ 16 CPL3A.

Vortex HPC réutilise la famille de moteurs de l’architecture GPU Logiix en l’orientant vers la superinformatique, les
simulations multiphysiques et le calcul scientifique. Il peut contribuer aux charges IA sans devoir être identique aux
CPL3A.

 Bloc Vortex                           Mission prévue                                                     Niveau de maturité


 VVC · Vortex Vector Core              SIMD/SIMT, FP32, INT, shaders et GPGPU                             Architecture conceptuelle


 VMC · Vortex Matrix Core              Calcul matriciel, modèles hybrides, opérations tensor              Architecture conceptuelle


 VIC · Vortex INT Core                 Opérations entières, compression, physique discrète                Architecture conceptuelle


 VRC · Vortex Ray Core                 BVH, intersections, ray/path tracing                               Architecture conceptuelle


 VGC / Raster                          Géométrie, maillage, visualisation et rasterisation                Architecture conceptuelle


 Scientific FP64                       Simulation numérique, CFD, éléments finis, astrophysique           Bloc prioritaire


 FP128 / haute précision               Méthodes numériques spécialisées                                   Support matériel ou
                                                                                                          logiciel à décider


 VDC / scheduler                       Ordonnancement parallèle, gestion des warps et caches              Architecture conceptuelle




     Compatibilité CUDA

     Les Vortex Vector Cores sont des unités Logiix de calcul massivement parallèle, pas des CUDA cores NVIDIA. La prise
     en charge du code CUDA nécessiterait une couche logicielle spécifique et des droits de propriété intellectuelle
     applicables; ce n’est pas une fonctionnalité garantie.


Performances Vortex HPC : non définies. Aucun nombre de SM, de cœurs vectoriels, de RT cores, de TFLOPS FP64 ou de
TFLOPS FP128 n’est fixé dans cette révision.
```

## Page 8

```text
LNX-3 PYTHAGORE / 07


CPU, interconnexion et cohérence
Pilotage hôte ARM personnalisé et fédération de plusieurs domaines de calcul.


 Sous-système                     Architecture / exigence                                                Statut


 Cœurs ARM performance            Exécution système, compilation, contrôle exigeant                      Choisi, nombre à définir


 Cœurs ARM efficacité             Orchestration permanente, service et gestion                           Choisi, nombre à définir


 Licence ARM                      Architecture License Agreement propre à Logiix à négocier              Hypothèse du scénario


 RISC-V de proximité              Microcontrôle et ordonnancement local                                  Option technique


 LNX Fabric 3                     Lien CPL3A ↔ CPL3A ↔ Vortex ↔ CPU ↔ mémoire                            Protocole et topologie à
                                                                                                         définir


 Liaison die-to-die               IP compatible UCIe, génération à sélectionner                          Cible


 CPO / réseau optique             Scale-out vers autres modules et racks                                 Cible


 Cohérence mémoire                Modèle hybride : mémoire locale et partage contrôlé                    À spécifier



Modèle de programmation recherché : des espaces mémoire explicitement accessibles, des copies asynchrones,
des événements de synchronisation et une couche d’ordonnancement capable de répartir les tâches IA, FP64 et 3D
selon la consommation et la congestion mémoire. Le partage physique de RAM ne signifie pas automatiquement une
cohérence globale à faible latence.


     Partenariat Apple–Logiix–Arm

     Dans l’univers du projet, l’alliance soutient le développement de cœurs ARM personnalisés. En pratique, chaque
     société devrait disposer de droits de licence appropriés; aucun transfert de licence Apple vers Logiix n’est considéré
     comme acquis.
```

## Page 9

```text
LNX-3 PYTHAGORE / 08


Alimentation, thermie et refroidissement
Objectif de rendement énergétique maximal : la consommation doit être validée sous charge réelle.


 Bloc / mode                              Budget provisoire                           Périmètre


 Compute Units — Eco                      760 × 8 W = 6,08 kW                         Units seules ; hors SRAM, PHY, HBM4, Vortex,
                                                                                      CPU


 Compute Units — nominal                  760 × 12 W = 9,12 kW                        Units seules ; hypothèse de puissance


 Compute Units — haut                     760 × 18 W = 13,68 kW                       Units seules ; non assimilable au TDP système


 Pythagore complet                        35 kW                                       Enveloppe système de planification, à valider


 Refroidissement cible                    Liquide direct-to-chip                      Gestion de plusieurs modules et circuits


 Supervision matérielle                   MCU STM32 + contrôleurs de puissance        Option de conception



Power management : DVFS multi-domaines, clock gating, power gating, ordonnanceur conscient de l’énergie,
plafonnement de puissance, isolation thermique de Vortex et des CPL3A, gestion des transitions de fréquence et
limitation du trafic mémoire inutile.

Thermie : l’architecture de refroidissement devra dissiper non seulement la puissance des Units, mais aussi celles
des piles HBM4, des régulateurs, de la SRAM empilée, des PHY et des interconnexions. La température de jonction
admissible et le delta-T liquide restent à spécifier.


     Ne pas interpréter 35 kW comme un TDP certifié

     Il s’agit d’une cible budgétaire à l’échelle de l’ensemble Pythagore. Il faudra vérifier la puissance instantanée et
     soutenue, l’alimentation 48 V ou équivalente, les tolérances, la redondance et le PUE des installations externes.
```

## Page 10

```text
LNX-3 PYTHAGORE / 09


Implantation physique et I/O
L’architecture multipackage doit être choisie après estimation des surfaces, du rendement et des liens.


 Élément                               Exigence d’intégration                                        État


 Nombre de chiplets IA                 38 CPL3A                                                      Fixé


 Enveloppe Vortex                      ≈ 16 CPL3A en surface logique                                 Cible sans mm²


 HBM4 installée                        122 × 48 Go                                                   Proposition d’étude


 Packages / interposeurs               Plusieurs, à dimensionner                                     Non défini


 Substrat & RDL                        Intégration haute densité / interposeurs locaux               Non défini


 Liaisons entre modules                Câbles électriques courts et/ou CPO                           À comparer


 Alimentation                          Rails distribués, VRM proches des charges                     À concevoir


 Rack / enclosure                      Format multi-modules liquide                                  À déterminer


 Interfaces client                     Ethernet / fabric externe / PCIe / management                 Versions et ports TBD


Plus le nombre de piles HBM4 et de chiplets augmente, plus le système rencontre des contraintes de shoreline
(périmètre disponible pour les interfaces), de yield, de planéité d’assemblage, d’intégrité du signal et de dissipation
thermique. Les interfaces UCIe ne suppriment pas les limites de portée : il faudra distinguer liens sur package et
interconnexions entre modules.


     Procédé Intel 12A Custom

     Le nom Intel 12A est une cible de l’univers Logiix, pas un nœud de fabrication officiellement documenté par Intel au
     16 novembre 2026. La feuille de route publique d’Intel mentionne notamment Intel 14A. Les dimensions et densités
     ne peuvent donc pas être estimées sérieusement à partir d’un PDK 12A inexistant publiquement.
```

## Page 11

```text
LNX-3 PYTHAGORE / 10


Pile logicielle et fiabilité
Pythagore est un système de calcul : les bibliothèques et l’outillage comptent autant que les moteurs.


 Couche                                Fonctions requises                                                          État


 Firmware & boot                       Boot vérifié, inventaire chiplets, init HBM4, diagnostics                   À développer


 Runtime Logiix                        Files de commandes, partitions, événements et flux                          À spécifier


 Compilateurs                          LLVM/MLIR et backends CPL3A / Vortex                                        Cible


 Framework IA                          PyTorch, JAX, ONNX, moteurs d’inférence et collectifs                       Portage à
                                                                                                                   développer


 Stack HPC                             OpenMP/OpenCL/SYCL ou APIs natives ; MPI, BLAS, FFT                         Choix à valider


 Ordonnanceur agentique                Répartition dynamique multi-modèles et multiagents                          Fonction clé


 Monitoring                            Télémétrie par Unit, erreurs, températures et perf/W                        Fonction clé


 Sécurité                              ECC, RAS, virtualisation, isolation des charges                             À définir et tester


Allocation dynamique : le Dynamic Compute Manager surveille les formats numériques, les besoins HBM/SRAM, les
accès distants, les priorités des agents, la consommation et les files d’exécution. Une tâche ne doit pas migrer si le
transfert de ses données consomme plus de temps ou d’énergie que le calcul local.

RAS : détection/correction ECC, scrubbing, isolation de liens défaillants, dégradation contrôlée des modules,
journalisation des erreurs et reprise des jobs. Les objectifs de disponibilité, MTBF, sécurité matérielle et certifications
sont à définir.


     Performance effective

     Les objectifs MXFP4 n’ont de sens commercial que si les opérations, bibliothèques et modèles réels atteignent une
     fraction exploitable de la crête. Le logiciel et les outils de profilage doivent être validés avant une garantie SLA.
```

## Page 12

```text
LNX-3 PYTHAGORE / 11


Plan de validation et critères d’acceptation
Étapes obligatoires avant publication d’une fiche produit de production.


 Domaine                          Tests / preuves attendues                                                  Statut


 Architecture Units               RTL, simulation, équivalence, synthèse, timing                             Non réalisé


 Perf numérique                   FP4/8/16/32/64, dense vs sparse, précision accumulée                       Non mesuré


 Mémoire                          SRAM 3D yield, latences, HBM4 SI, ECC, débit soutenu                       Non réalisé


 Interconnexions                  Topologie, débit effectif, latence P2P, congestion                         Non réalisé


 Thermique                        CFD, hotspots, débit liquide, scénarios de panne                           Non réalisé


 Énergie                          Perf/W, power gating, idle, max load, transitoires                         Non réalisé


 Logiciel                         Stabilité pilotes, compilation, PyTorch/JAX, MPI                           Non réalisé


 Fiabilité                        Burn-in, vieillissement, sécurité, RAS et disponibilité                    Non réalisé


 Industrialisation                Supply chain HBM4, packaging, inspection, test                             Non réalisé


Les premières mesures officielles devraient être publiées avec : version de microcode, format dense/sparse,
définition des opérations par FMA, fréquence effective, taille du lot, température, puissance absorbée, type de
précision et logiciel utilisé.


     Risques critiques du calendrier 2028

     Absence d’un procédé Intel 12A public; volume de SRAM 3D; fabrication et interconnexion de 38 CPL3A; intégration
     de 122 piles HBM4; architecture Vortex HPC et logiciel encore non dimensionnés; budget thermique multi-module.
     Une mise en production en 2028 est un objectif très agressif.
```

## Page 13

```text
LNX-3 PYTHAGORE / 12


Positionnement dans la famille LNX-3
Pythagore est l’Ultracalculateur scientifique / agentique; Oracle est l’accélérateur hyperscale IA.


 Critère                               LNX-3 Oracle                          LNX-3 Pythagore


 CPL3A                                 16                                    38


 Compute Units IA                      320                                   760


 Vortex HPC                            Non                                   Oui, ≈ 16 CPL3A en surface


 MXFP4 théorique                       176 PFLOPS                            418 PFLOPS (hors Vortex)


 FP8 théorique                         88 PFLOPS                             209 PFLOPS (hors Vortex)


 SRAM locale, CPL3A                    10 Gio                                23,75 Gio


 SRAM 3D, CPL3A                        31,25 Gio                             74,22 Gio


 HBM4 installée (proposée)             2 304 Go                              5 856 Go


 Mission                               Entraînement / inférence hyperscale   AGI expérimentale, HPC, simulation, IA agentique



Les deux systèmes s’appuient sur le même chiplet CPL3A à 20 Units. Les capacités de Vortex HPC ne sont pas
incluses dans les performances CPL3A affichées. Les débits entre plusieurs systèmes, l’évolutivité rack et les
configurations clients restent non finalisés.

Décisions encore ouvertes : nombre et classes de cœurs ARM, microarchitecture physique Vortex, fréquence des
moteurs, composition des HBM PHY, UCIe exact, dimensions en mm², packages, nombre de rails, refroidissement,
versions d’API, efficacité réelle et coûts des wafers.


     Contrôle de cohérence

     38 CPL3A × 20 Units = 760 Units. 760 × 550 TFLOPS MXFP4 = 418 PFLOPS. 760 × (32 + 100) Mio = 100 320 Mio
     SRAM. 122 × 48 Go HBM4 = 5 856 Go. Toutes les additions sont théoriques; aucune ne démontre la faisabilité du
     système.
```

## Page 14

```text
LNX-3 PYTHAGORE / 13


Références, hypothèses et révisions
Sources publiques utilisées uniquement pour vérifier l’existence des technologies et standards.


 Référence                                           Ce qu’elle permet de vérifier


 [1] Intel Foundry, VLSI Symposium, 16               Feuille de route Intel 18A-P / 14A; 12A absent de la documentation publique citée.
 juin 2026


 [2] Intel, communiqué SEC 2026                      Développement 14A; enjeux de fabrication et risques de montée en volume.


 [3] Micron, HBM4, 2026                              HBM4 36 Go et échantillons 48 Go ; débit de référence ~2,8 To/s par empilement.


 [4] UCIe Consortium, spécifications 3.0 /           Interconnexion chiplet; données de débit et fonctions de gestion.
 4.0


 [5] Arm Holdings, rapport FY2026 (20-F)             Architecture License Agreement et conditions générales de droits de conception CPU.


[1] https://www.intel.com/content/www/us/en/newsroom/news/corporate/intel-foundry-details-process-milestones-future-innovation-at-vlsi-sympo
sium.html
[2] https://www.sec.gov/Archives/edgar/data/50863/000005086326000191/intc-20260926.htm
[3] https://www.micron.com/products/memory/hbm/hbm4
[4] https://www.uciexpress.org/specifications/ucie-3-0
[5] https://www.sec.gov/Archives/edgar/data/1973239/000197323926000097/arm-20260331.htm


Historique : Rev. 0.5 — 16-11-2026 : consolidation de 38 CPL3A, 760 Units, Vortex HPC, 5,856 To HBM4 et des objectifs
d’efficacité. Remplace les anciennes configurations à 16 puis 32 CPL3A du Pythagore.


      Avis d’usage

      Logiix et LNX-3 Pythagore sont des éléments d’un projet de conception fictif. Les alliances mentionnées relèvent du
      scénario utilisateur, pas de partenariats contractuels confirmés. Intel, Micron, Arm, NVIDIA, CUDA et UCIe restent les
      marques et technologies de leurs détenteurs respectifs.
```
