---
title: "LOGIIX — Vortex HPC 1"
subtitle: "Architecture hybride de calcul scientifique, consolidation IA et inférence — LNX-3 Pythagore"
author: "Projet Logiix"
date: "2026-11-23"
lang: fr-CA
version: "0.2"
status: "Architecture conceptuelle — objectifs de conception non validés en silicium"
architecture: "Vortex HPC Generation 1"
collaboration_conceptuelle:
  - NVIDIA
  - Intel
---

# 1. Présentation générale

**Vortex HPC 1** est un accélérateur hétérogène de calcul haute performance développé, dans le scénario industriel Logiix, conjointement avec **NVIDIA et Intel**.

Il constitue le principal sous-système de calcul scientifique et de consolidation des modèles d'intelligence artificielle du **LNX-3 Pythagore**.

Contrairement aux accélérateurs IA classiques, dont l'architecture est principalement optimisée pour l'entraînement et l'inférence, Vortex HPC adopte une approche hybride combinant :

1. Le calcul scientifique massif et les opérations numériques complexes.
2. La consolidation, l'optimisation et la correction des modèles d'intelligence artificielle.
3. L'inférence haute performance, particulièrement les charges nécessitant des calculs complexes et un raisonnement prolongé.

Son architecture associe des moteurs vectoriels, matriciels, scientifiques et spécialisés, un système de mémoire partagé à haute bande passante, ainsi qu'un ordonnanceur capable de répartir dynamiquement les ressources.

## 1.1 Philosophie architecturale

L'architecture repose sur trois principes fondamentaux.

**Performance scientifique :** conserver un excellent rendement sur les opérations FP64, les méthodes numériques et les simulations complexes, sans dépendre exclusivement des unités matricielles à faible précision.

**Efficacité de consolidation :** réduire le coût de l'amélioration des modèles IA par une accélération conjointe des étapes de génération, évaluation, distillation, apprentissage par renforcement et validation.

**Polyvalence :** permettre l'exécution de calculs scientifiques, de traitements IA et de charges hybrides sans imposer de transferts systématiques entre accélérateurs spécialisés.

La consolidation n'est donc pas considérée comme une simple variante de l'entraînement. Elle constitue une fonction architecturale prioritaire.

# 2. Positionnement dans LNX-3 Pythagore

Le LNX-3 Pythagore conserve deux grands ensembles de calcul complémentaires.

| Composant | Quantité | Fonction principale |
|---|---:|---|
| CPL3A | 38 chiplets | Entraînement et inférence IA |
| Compute Units CPL3A | 760 | Accélération IA massive |
| Vortex HPC 1 | 1 sous-système logique | HPC, consolidation et inférence |
| CPU ARM Logiix | À définir | Orchestration générale |
| LNX Fabric 3 | 1 infrastructure | Interconnexion haute performance |
| HBM4 | Mémoire partagée | Données et modèles |

## 2.1 Surface et équivalence de calcul

Vortex HPC dispose d'une enveloppe physique conceptuelle équivalente à environ **16 CPL3A**.

Toutefois, son efficacité architecturale et son optimisation spécialisée doivent lui permettre d'atteindre une **performance d'inférence équivalente à 24 CPL3A**, sur une suite de charges de référence représentatives.

| Indicateur | Valeur cible |
|---|---:|
| Enveloppe de surface | ≈ 16 CPL3A |
| Performance d'inférence équivalente | 24 CPL3A |
| Équivalent Compute Units IA | 480 CU |
| Gain de performance par surface visé | 1,50× |
| Surcroît de performance par surface | +50 % |
| Architecture | HPC / consolidation / inférence |

L'équivalence de 480 CU constitue une mesure comparative. Elle ne signifie pas que Vortex HPC contient physiquement 480 Compute Units CPL3A.

Ce gain de 50 % est un **objectif de performance par surface sur des charges d'inférence sélectionnées**, et non une garantie universelle d'efficacité énergétique.

## 2.2 Équivalence MXFP4

La fiche Pythagore Rev 0.5 attribue 418 PFLOPS MXFP4 théoriques à l'ensemble des 38 CPL3A.

En utilisant cette base :

- Performance théorique moyenne par CPL3A : 11 PFLOPS MXFP4.
- Équivalence de 24 CPL3A : 264 PFLOPS MXFP4.
- Puissance théorique CPL3A + équivalence Vortex : 682 PFLOPS MXFP4.

**Précision importante :** les 264 PFLOPS constituent une valeur d'équivalence, pas une puissance arithmétique native démontrée du Vortex. Pour revendiquer 264 PFLOPS MXFP4 physiques, son moteur matriciel devra effectivement réaliser ce débit avec la même convention de comptage des opérations.

De même, les 682 PFLOPS ne doivent pas être annoncés comme une performance totale certifiée tant que cette condition n'est pas satisfaite.

# 3. Fiche technique — Objectifs Gen 1

Les valeurs suivantes définissent une première configuration technique de référence. Elles restent modifiables après étude de faisabilité, notamment en fonction du procédé de fabrication, de l'enveloppe thermique et de la surface disponible.

| Caractéristique | Spécification proposée |
|---|---|
| Architecture | Vortex HPC Gen 1 |
| Type | Accélérateur hétérogène HPC/IA |
| Collaboration conceptuelle | Logiix × NVIDIA × Intel |
| Groupes d'exécution HPC | 64 Vortex Compute Clusters |
| Fréquence cible | 1,5 GHz nominal |
| Plage de fréquence étudiée | 1,4–1,8 GHz |
| FP32 vectoriel | 192 TFLOPS |
| FP64 scientifique | 96 TFLOPS |
| Rapport FP64/FP32 | 1:2 |
| FP128 | Support logiciel initial |
| FP16 / BF16 | Accélération matricielle native |
| FP8 | Accélération matricielle native |
| FP4 / MXFP4 | Accélération IA spécialisée |
| INT8 / INT4 | Inférence quantifiée |
| Inférence | Équivalence cible 24 CPL3A |
| Cache L2 partagé | 32 Mio, cible initiale |
| Cache L3 HPC | 256 Mio, cible initiale |
| Mémoire externe | HBM4 du LNX-3 |
| Bande passante HBM4 allouable | Jusqu'à 12 To/s, objectif |
| Puissance du sous-système | Cible de dimensionnement : 1,2 kW |
| Ordonnancement | Multi-workload dynamique |
| Fiabilité | ECC, contrôles numériques, journalisation |
| Statut | Conception conceptuelle |

La fréquence nominale de 1,5 GHz et le nombre de groupes sont retenus pour établir une première microarchitecture.

Les 192 TFLOPS FP32 et 96 TFLOPS FP64 supposent un nombre suffisant d'unités FMA, capables de maintenir leurs débits sur les instructions correspondantes.

L'objectif de 1,2 kW englobe le sous-système Vortex mais doit encore être ventilé entre calcul, caches, interconnexion et interfaces. Il n'inclut pas nécessairement la puissance totale de la HBM4 système.

Les performances indiquées sont des **pics théoriques visés**, pas des performances applicatives soutenues.

# 4. Architecture interne

Vortex HPC 1 est organisé en plusieurs familles de moteurs pouvant coopérer dans une même charge de travail.

| Bloc | Désignation | Fonction |
|---|---|---|
| VVC | Vortex Vector Core | Calcul vectoriel FP32/FP64 |
| VMC | Vortex Matrix Core | Calcul matriciel IA |
| VSC | Vortex Scientific Core | Calcul scientifique spécialisé |
| VCC | Vortex Consolidation Core | Accélération des opérations de consolidation |
| VIC | Vortex Integer Core | Calcul entier, indexation et compression |
| VEC | Vortex Evaluation Core | Évaluation, comparaison et vérification |
| VRC | Vortex Ray Core | Intersections et visualisation scientifique |
| VGC | Vortex Geometry Core | Géométrie, maillages et rasterisation |
| VDC | Vortex Dynamic Controller | Ordonnancement et gestion des ressources |
| VMM | Vortex Memory Manager | Gestion des caches, données et transferts |

Ces blocs désignent des fonctions logiques. Certains pourront partager des unités d'exécution physiques afin de réduire la surface et la consommation.

## 4.1 VVC — Vortex Vector Core

Le VVC constitue le moteur de calcul général de l'architecture.

Il prend en charge :

- FP32 et FP64.
- Opérations INT32 et INT64.
- Calcul SIMD et SIMT.
- Instructions FMA.
- Réductions et opérations vectorielles.
- Calculs numériques irréguliers.
- Exécution GPGPU.
- Opérations atomiques et synchronisation.

### Configuration de référence

Le système comprend 64 Vortex Compute Clusters.

Chaque cluster possède une capacité vectorielle théorique de référence de :

- 1 024 voies FP32 FMA.
- 512 voies FP64 FMA.

À 1,5 GHz, avec deux opérations comptabilisées par FMA :

**FP32 :**

64 × 1 024 × 2 × 1,5 GHz = 196,6 TFLOPS.

**FP64 :**

64 × 512 × 2 × 1,5 GHz = 98,3 TFLOPS.

Les valeurs commerciales internes retenues sont respectivement **192 TFLOPS FP32** et **96 TFLOPS FP64**, sous réserve de faisabilité.

Les voies représentent une capacité logique d'exécution FMA. Leur réalisation physique, leur partage et leur organisation en pipelines seront définis durant la conception RTL.

## 4.2 VMC — Vortex Matrix Core

Le VMC est le moteur tensoriel de Vortex HPC.

Son rôle principal est d'accélérer les étapes matricielles de consolidation et d'inférence.

### Formats de calcul

| Format | Usage prioritaire |
|---|---|
| FP32 / TF32 | Calcul et accumulation de précision |
| BF16 | Consolidation et ajustement des modèles |
| FP16 | Apprentissage et inférence |
| FP8 | Calcul tensoriel accéléré |
| MXFP8 | Inférence et consolidation quantifiées |
| MXFP4 | Inférence haut débit |
| INT8 | Inférence entière |
| INT4 | Modèles compressés et quantifiés |

Le VMC doit également prendre en charge des combinaisons où les multiplications utilisent une faible précision, mais les accumulations exploitent un format plus précis.

La performance équivalente à 24 CPL3A doit être atteinte principalement grâce à ces moteurs, aux optimisations de mémoire et à la réduction des coûts d'ordonnancement.

Cette équivalence doit être testée séparément pour chaque famille de modèles et format numérique.

## 4.3 VSC — Vortex Scientific Core

Le VSC est un moteur scientifique dédié aux opérations numériques complexes.

Il privilégie la précision, la stabilité et les performances soutenues.

### Fonctionnalités

- FP64 haute performance.
- Calcul scientifique vectoriel.
- Résolution de systèmes linéaires.
- Algèbre linéaire dense et creuse.
- Transformées de Fourier.
- Méthodes itératives.
- Simulation multiphysique.
- Dynamique des fluides.
- Équations différentielles.
- Analyse numérique.
- Réductions numériques reproductibles.

### FP128

La première génération supporte les opérations de précision quadruple par logiciel, conformément aux représentations numériques appropriées.

Une accélération matérielle partielle peut être étudiée pour les fonctions les plus coûteuses.

Il faut distinguer :

- La précision binaire128 conforme à IEEE 754.
- Les méthodes multi-mots comme double-double.
- L'arithmétique à précision arbitraire.

Ces techniques ne sont pas systématiquement interchangeables.

### Efficacité scientifique

L'objectif est de limiter la perte de performance entre les opérations FP32 et FP64.

Le rapport FP64/FP32 de 1:2 est donc un choix architectural prioritaire.

Le VSC doit également intégrer des mécanismes de détection d'erreurs arithmétiques et de contrôle de précision.

# 5. VCC — Vortex Consolidation Core

Le **Vortex Consolidation Core** représente l'une des innovations principales de l'architecture.

Il est conçu pour rendre la consolidation des modèles IA aussi efficace que possible.

La consolidation regroupe ici plusieurs méthodes permettant d'améliorer un modèle après son entraînement initial, notamment par distillation, apprentissage par renforcement, correction d'erreurs, spécialisation et validation.

Ces méthodes ne sont pas toutes exécutées directement dans le VCC : celui-ci coordonne et accélère des opérations distribuées entre les VMC, VVC, VSC et VEC.

## 5.1 Distillation

Le système prend en charge la distillation de connaissances entre modèles.

### Fonctionnement

1. Un modèle enseignant génère des réponses ou distributions cibles.
2. Les résultats sont évalués et filtrés.
3. Les données de qualité sont conservées.
4. Le modèle étudiant apprend à reproduire les comportements retenus.
5. Les différences entre enseignant et étudiant sont analysées.
6. Des cycles supplémentaires ciblent les déficiences détectées.

### Accélérations recherchées

- Exécution parallèle de modèles enseignants et étudiants.
- Réutilisation intelligente des états intermédiaires.
- Compression et stockage des distributions de sortie.
- Distillation sélective des couches.
- Distillation des sorties et représentations internes.
- Ordonnancement des micro-lots.
- Transferts directs des données entre moteurs.

L'objectif est de réduire le coût combiné de génération, de transfert, de calcul de perte et d'optimisation.

## 5.2 Apprentissage par renforcement

Vortex HPC doit pouvoir prendre en charge des pipelines de reinforcement learning appliqués aux modèles d'IA.

Méthodes envisagées :

- PPO.
- GRPO et variantes associées.
- Optimisation à partir de préférences.
- Entraînement avec modèles de récompense.
- Optimisation sous contraintes.
- Apprentissage à partir de récompenses vérifiables.

### Architecture de traitement

Le système peut exécuter simultanément :

- La génération de trajectoires ou réponses.
- L'évaluation des résultats.
- Le calcul des récompenses.
- La gestion des expériences.
- Le calcul des gradients.
- La mise à jour du modèle.
- Les tests de validation.

Le VDC orchestre ces opérations pour limiter l'inactivité des unités de calcul.

Le principal objectif n'est pas uniquement d'augmenter les FLOPS, mais aussi de réduire les temps d'attente entre la génération, l'évaluation et les mises à jour des paramètres.

## 5.3 Correction d'erreurs des modèles IA

Vortex HPC intègre un ensemble de mécanismes de détection et de correction des erreurs comportementales ou numériques.

Il faut distinguer deux catégories.

**Erreurs matérielles et numériques :**

- Détection d'erreurs mémoire.
- Vérification d'intégrité des tenseurs.
- Contrôle des NaN et des dépassements.
- Vérification des gradients.
- Détection des instabilités numériques.

**Erreurs des modèles :**

- Réponses factuellement incorrectes.
- Contradictions.
- Erreurs mathématiques.
- Erreurs de programmation.
- Mauvaise utilisation des outils.
- Raisonnement incohérent.
- Régression après ajustement.

La deuxième catégorie nécessite des évaluateurs, des références fiables ou des mécanismes de vérification externes. Elle ne peut pas être corrigée automatiquement par une simple instruction matérielle.

### Pipeline de correction

**Détection → Classification → Vérification → Génération de données correctives → Optimisation → Validation.**

Le système utilise les résultats de validation pour déterminer si la correction améliore réellement le modèle.

Une modification qui améliore une catégorie de problèmes mais détériore significativement d'autres capacités doit pouvoir être rejetée.

# 6. VEC — Vortex Evaluation Core

Le VEC est un moteur logique spécialisé dans les opérations d'évaluation nécessaires à la consolidation.

Il se distingue du VCC, qui organise les processus d'amélioration.

### Fonctions

- Exécution de bancs de tests.
- Comparaison de réponses.
- Évaluation de modèles enseignants et étudiants.
- Mesures de cohérence.
- Vérification numérique.
- Calcul de métriques de performance.
- Détection de régressions.
- Comparaison entre versions de modèles.

Le VEC exploite les unités matricielles ou scientifiques selon la nature des évaluations.

### Évaluation à plusieurs niveaux

| Niveau | Fonction |
|---|---|
| Numérique | Détecter les erreurs arithmétiques |
| Syntaxique | Vérifier les sorties structurées |
| Fonctionnel | Tester les programmes et calculs |
| Factuel | Comparer avec des références |
| Comportemental | Évaluer la qualité des réponses |
| Global | Détecter les régressions |

Le VEC facilite l'automatisation des campagnes d'évaluation.

Cependant, les évaluateurs ne constituent pas une preuve absolue de vérité ou de qualité.

# 7. Consolidation hybride avancée

La véritable spécialisation de Vortex HPC réside dans sa capacité à combiner plusieurs méthodes de consolidation au sein d'un même pipeline.

## 7.1 Architecture de consolidation

Le pipeline conceptuel est organisé en huit étapes.

**Étape 1 — Analyse du modèle**

Identification des faiblesses, lacunes, erreurs fréquentes et possibilités de compression.

**Étape 2 — Génération de données**

Production de nouvelles données par modèles enseignants, simulations ou programmes externes.

**Étape 3 — Vérification**

Contrôle de la validité des réponses et élimination des données erronées ou peu fiables.

**Étape 4 — Distillation**

Transfert des connaissances sélectionnées vers le modèle cible.

**Étape 5 — Apprentissage par renforcement**

Optimisation complémentaire selon les objectifs définis.

**Étape 6 — Correction ciblée**

Traitement des catégories d'erreurs encore présentes.

**Étape 7 — Validation globale**

Comparaison avec la version précédente du modèle sur les performances, la sécurité, la robustesse et les coûts.

**Étape 8 — Acceptation ou retour arrière**

Conservation de la nouvelle version uniquement si elle satisfait les critères de validation.

La séquence est configurable. Certaines étapes peuvent être répétées, omises ou exécutées parallèlement.

## 7.2 Consolidation continue

Vortex HPC peut participer à un environnement de consolidation continue.

Dans ce mode, les modèles sont périodiquement réévalués puis améliorés à partir de nouvelles données contrôlées.

L'architecture doit notamment prendre en charge :

- Les versions successives des modèles.
- Les checkpoints.
- La reproductibilité des expériences.
- Les campagnes d'évaluation automatisées.
- Les optimisations ciblées.
- La détection de dérive.
- Le retour arrière sécurisé.

Les changements de paramètres nécessitent des mécanismes d'autorisation et de validation pour éviter qu'une modification non vérifiée ne soit déployée directement.

# 8. Inférence — Équivalent 24 CPL3A

L'inférence constitue le troisième objectif du Vortex HPC.

Contrairement aux CPL3A, dont la vocation principale reste le calcul IA massif, Vortex HPC est spécialisé pour les charges hybrides et les traitements complexes.

## 8.1 Performances visées

| Paramètre | Objectif |
|---|---|
| Performance équivalente | 24 CPL3A |
| Équivalence de Compute Units | 480 |
| Équivalent de pointe MXFP4 | 264 PFLOPS |
| Rapport performance/surface visé | 1,5× |
| Formats optimisés | FP8, MXFP4, INT8, INT4 |
| Type de charges | Génération, raisonnement, IA scientifique |
| Ordonnancement | Dynamique |
| Traitement par lots | Continu et adaptable |

L'équivalence de 24 CPL3A sera définie par un ensemble de benchmarks communs. Elle devra tenir compte du débit, de la latence, de la précision des modèles et des limites de mémoire.

Elle ne représente pas une performance identique pour toutes les tâches.

## 8.2 Inférence complexe

Vortex HPC est particulièrement destiné aux charges combinant :

- Inférence de modèles de langage.
- Génération de plusieurs réponses candidates.
- Raisonnement mathématique.
- Exécution de programmes.
- Vérification de solutions.
- Simulations scientifiques.
- Utilisation d'outils externes.
- Génération et évaluation de données synthétiques.

Le système peut transférer les tâches matricielles vers les VMC et les traitements numériques vers les VVC/VSC, sans nécessiter systématiquement un changement d'accélérateur.

## 8.3 Gestion du KV cache

La mémoire de contexte des modèles doit disposer d'un gestionnaire spécialisé.

Fonctionnalités prévues :

- KV cache paginé.
- Allocation dynamique.
- Réutilisation des préfixes compatibles.
- Gestion des séquences longues.
- Déchargement contrôlé vers la HBM4.
- Quantification des caches selon le modèle.
- Isolation entre utilisateurs et charges.

L'efficacité de ces mécanismes influence directement la capacité d'inférence soutenue.

# 9. Mémoire et interconnexion

Vortex HPC utilise la mémoire HBM4 et l'infrastructure LNX Fabric 3 du LNX-3 Pythagore.

L'architecture doit privilégier les transferts directs entre ses sous-systèmes.

## 9.1 Hiérarchie mémoire

| Niveau | Configuration cible |
|---|---|
| Registres | Distribués dans les clusters |
| Mémoire locale | Propre à chaque cluster |
| Cache L1 | Par groupe d'exécution |
| Cache L2 | 32 Mio partagés |
| Cache L3 | 256 Mio partagés |
| Mémoire principale | HBM4 |
| Bande passante réservables | Jusqu'à 12 To/s, cible |
| Interconnexion | LNX Fabric 3 |

La cohérence des caches, les domaines mémoire et le protocole exact restent à spécifier.

## 9.2 Gestion intelligente de la mémoire

Le VMM doit permettre :

- La prélecture des tenseurs.
- La réutilisation des poids de modèles.
- La gestion des données scientifiques.
- Les transferts asynchrones.
- Les opérations de réduction.
- La limitation des copies mémoire.
- Le contrôle de qualité de service.
- La protection contre la corruption des données.

Pour les processus de consolidation, il doit être possible de réutiliser localement les résultats des modèles enseignants et évaluateurs.

Ce mécanisme vise à réduire les transferts coûteux entre étapes de traitement.

# 10. VDC — Vortex Dynamic Controller

Le VDC assure la gestion des ressources de calcul.

Il agit comme un ordonnanceur matériel et logiciel capable de coordonner les différents moteurs.

## 10.1 Objectifs

- Maximiser l'utilisation des unités de calcul.
- Réduire les périodes d'inactivité.
- Minimiser les copies mémoire.
- Respecter les priorités des charges.
- Limiter les conflits d'accès à la HBM4.
- Optimiser la consommation.
- Prévenir les interblocages.
- Maintenir l'isolation des travaux.

## 10.2 Profils d'exécution

Trois profils principaux sont prévus.

| Profil | Priorité | Gestion privilégiée |
|---|---|---|
| Scientific HPC | Calcul FP64 et simulations | VSC + VVC |
| AI Consolidation | Distillation, RL, correction | VCC + VMC + VEC |
| AI Inference | Latence et débit | VMC + VVC |

Les profils ne correspondent pas à des partitions matérielles fixes.

Les ressources doivent pouvoir être redistribuées automatiquement selon les besoins des applications.

## 10.3 Optimisation énergétique

Le VDC est également chargé de la gestion de l'alimentation.

Mécanismes proposés :

- DVFS par domaines.
- Clock gating.
- Power gating des unités inactives.
- Répartition thermique.
- Limitation de puissance.
- Gestion des priorités énergétiques.
- Surveillance du rendement par charge.

**Objectif : maximiser la quantité de travail utile par joule**, et non uniquement la fréquence ou le nombre de FLOPS.

Pour la consolidation, le rendement énergétique sera notamment mesuré par le coût d'amélioration validée des modèles, et non uniquement par le nombre de tokens générés.

# 11. Collaboration technologique NVIDIA × Intel × Logiix

Dans le scénario de conception conjoint, Vortex HPC est développé avec NVIDIA et Intel afin de bénéficier d'un environnement logiciel partagé.

Cette collaboration constitue une hypothèse de conception du projet et ne doit pas être présentée comme un partenariat industriel effectivement annoncé.

## 11.1 Répartition conceptuelle des contributions

| Partenaire | Domaines de contribution |
|---|---|
| Logiix | Architecture Vortex, VCC, VEC, intégration LNX |
| NVIDIA | Accélération IA, calcul parallèle, écosystème CUDA |
| Intel | Calcul scientifique, vectorisation, SYCL et oneAPI |
| Développement conjoint | Compilateurs, pilotes, bibliothèques et optimisation |

La propriété intellectuelle des composants et les conditions de licence doivent être déterminées dans les accords de développement.

## 11.2 Compatibilité NVIDIA

L'objectif du partenariat est d'établir une prise en charge native ou officiellement validée des interfaces pertinentes de l'écosystème NVIDIA.

Technologies ciblées :

- CUDA Runtime.
- CUDA Driver API.
- Bibliothèques CUDA mathématiques.
- cuBLAS.
- cuSOLVER.
- cuSPARSE.
- cuFFT.
- cuDNN.
- NCCL.
- Outils de profilage et de diagnostic.

La compatibilité exigerait une adaptation explicite des compilateurs, bibliothèques et pilotes.

Même dans le cadre d'un partenariat, l'exécution d'applications CUDA ne devient pas automatiquement possible simplement parce que l'architecture dispose de cœurs vectoriels.

## 11.3 Compatibilité Intel

Le partenariat Intel est principalement orienté vers le calcul scientifique et les standards de programmation hétérogène.

Technologies ciblées :

- oneAPI.
- SYCL.
- oneMKL.
- oneDNN.
- oneCCL.
- Intel LLVM/Clang.
- Outils d'analyse de performances.
- Bibliothèques scientifiques optimisées.

L'objectif est de permettre aux applications scientifiques et IA compatibles avec ces environnements d'exploiter Vortex HPC à travers des backends adaptés.
