---
title: "LOGIIX — Vortex HPC"
subtitle: "Architecture conceptuelle du sous-système de calcul scientifique LNX-3 Pythagore"
author: "Projet Logiix"
date: "2026-11-18"
lang: fr-CA
version: "0.1"
status: "Concept — non validé en silicium"
---

# Présentation générale

**Vortex HPC** est le sous-système de calcul général et scientifique prévu dans le **LNX-3 Pythagore**. Il complète la matrice d'accélération IA constituée de **38 chiplets CPL3A**, soit **760 Compute Units IA**. Vortex HPC est **distinct** des CPL3A : il ne constitue pas une troisième matrice de chiplets CPL3A.

Son enveloppe de surface *conceptuelle* correspond approximativement à **16 équivalents CPL3A**. Cette équivalence décrit une allocation fonctionnelle de surface, **pas** 16 chiplets physiques additionnels. La surface réelle en mm² et le partitionnement matériel ne sont pas établis.

Le sous-système reprend des familles de moteurs envisagées pour l'architecture GPU Logiix et les adapte à la superinformatique, aux simulations multiphysiques, à la visualisation et au calcul scientifique. Il peut également contribuer à certaines charges d'IA.

> **Statut des données :** architecture conceptuelle tirée de la fiche *LOGIIX LNX-3 Pythagore — Datasheet Rev 0.5*, section « Vortex HPC — Calcul général et scientifique », datée du 16 novembre 2026. Aucune performance Vortex HPC n'est mesurée ni garantie.

# Position dans LNX-3 Pythagore

| Élément | Fonction | Définition |
|---|---|---|
| 38 × CPL3A | Accélération IA principale | 760 Compute Units IA |
| Vortex HPC | Calcul général, scientifique et graphique | Enveloppe de surface ≈ 16 CPL3A |
| CPU ARM Logiix personnalisés | Pilotage et services système | Cœurs performance et efficacité; nombres à définir |
| LNX Fabric 3 et HBM4 | Interconnexion et mémoire système | Topologie physique à finaliser |

La comparaison de surface conceptuelle donne **38 + 16 = 54 équivalents CPL3A**, *avant* prise en compte des CPU, PHY, I/O, contrôleurs mémoire et contraintes de packaging. Cette somme n'est pas un décompte de chiplets physiques.

# Blocs fonctionnels

| Bloc | Nom | Mission prévue | Maturité |
|---|---|---|---|
| VVC | Vortex Vector Core | SIMD/SIMT, FP32, opérations entières, shaders et GPGPU | Architecture conceptuelle |
| VMC | Vortex Matrix Core | Calcul matriciel, modèles hybrides et opérations tensorielles | Architecture conceptuelle |
| VIC | Vortex INT Core | Opérations entières, compression et physique discrète | Architecture conceptuelle |
| VRC | Vortex Ray Core | Structures BVH, intersections et ray/path tracing | Architecture conceptuelle |
| VGC / Raster | Géométrie et rasterisation | Géométrie, maillages, visualisation et rasterisation | Architecture conceptuelle |
| Scientific FP64 | Moteur scientifique double précision | Simulation numérique, CFD, éléments finis, astrophysique | Bloc prioritaire |
| FP128 / haute précision | Calcul de précision étendue | Méthodes numériques spécialisées | Matériel ou logiciel à décider |
| VDC / scheduler | Contrôle et ordonnancement | Ordonnancement parallèle, warps et caches | Architecture conceptuelle |

## VVC — Vortex Vector Core

Moteur destiné au calcul massivement parallèle de type SIMD/SIMT, notamment aux traitements FP32, entiers, shaders et GPGPU. Les dimensions des groupes d'exécution, le nombre d'unités, la largeur vectorielle et les fréquences restent à définir.

## VMC — Vortex Matrix Core

Moteur spécialisé pour les calculs matriciels et tensoriels. Les formats numériques pris en charge, les débits et les liens avec la matrice CPL3A restent à spécifier.

## VIC — Vortex INT Core

Bloc destiné aux opérations entières, à la compression et à certains calculs de physique discrète. Les instructions et les mécanismes d'accélération restent à définir.

## VRC — Vortex Ray Core

Moteur prévu pour accélérer les structures BVH et les tests d'intersection nécessaires au ray tracing et au path tracing. Aucun nombre de cœurs ni débit n'est fixé.

## VGC / Raster

Sous-système prévu pour les opérations de géométrie, de maillage, de visualisation et de rasterisation. L'interface graphique et la pile logicielle restent à définir.

## Scientific FP64

Bloc considéré **prioritaire** dans la conception, pour le calcul scientifique en double précision : simulations numériques, dynamique des fluides numérique (CFD), méthodes des éléments finis et astrophysique. Aucun débit FP64 n'est encore fixé.

## FP128 et haute précision

Le support des calculs de haute précision est envisagé pour des méthodes numériques spécialisées. La fiche source laisse explicitement ouverte la décision entre **accélération matérielle** et **implémentation logicielle**.

## VDC — Ordonnanceur

Le VDC/scheduler doit gérer l'ordonnancement parallèle, les warps et les caches. La hiérarchie exacte, les politiques de partage et l'articulation avec le Dynamic Compute Manager du LNX-3 restent à concevoir.

# Charges de travail envisagées

- Superinformatique et calcul scientifique général.
- Simulations multiphysiques, CFD et méthodes des éléments finis.
- Astrophysique et autres applications numériques exigeant le FP64.
- Géométrie, visualisation, rasterisation et rendu 3D.
- Calcul matriciel, tensoriel et contribution éventuelle aux charges d'IA.

Ces domaines correspondent à des **missions prévues**, non à des fonctionnalités validées par des essais matériels.

# Logiciel et compatibilité

Les **Vortex Vector Cores ne sont pas des CUDA cores NVIDIA**. L'exécution de logiciels CUDA nécessiterait une couche de compatibilité spécifique ainsi que le respect des droits de propriété intellectuelle applicables. **La compatibilité CUDA n'est pas garantie.**

Les API de calcul, compilateurs, pilotes, bibliothèques numériques, interfaces de programmation et mécanismes de synchronisation ne sont pas définis dans la révision source.

# Spécifications non définies

| Paramètre | État |
|---|---|
| Nombre de SM / groupes d'exécution | Non défini |
| Nombre de VVC / cœurs vectoriels | Non défini |
| Nombre de VRC / unités de ray tracing | Non défini |
| Performance FP64 (TFLOPS) | Non définie |
| Performance FP128 (TFLOPS) | Non définie |
| Performance FP32 / INT / matricielle | Non définie |
| Fréquences et tensions | Non définies |
| Surface réelle en mm² | Non définie |
| Hiérarchie détaillée des caches | Non définie |
| Consommation propre à Vortex HPC | Non définie |
| API, pilotes et compilateurs | À concevoir |
| Packaging et partitionnement physique | À déterminer |

**Ne pas confondre :** les **418 PFLOPS MXFP4** théoriques annoncés pour Pythagore proviennent des **760 Compute Units CPL3A**, **hors Vortex HPC**. Ils ne permettent pas de déduire les performances de Vortex HPC.

# Questions d'ingénierie à résoudre

1. Quelle proportion de l'enveloppe Vortex HPC attribuer aux VVC, VMC, VIC, VRC, VGC et FP64 ?
2. Quel niveau de performance FP64 cibler, avec quelle efficacité énergétique ?
3. Faut-il une unité FP128 dédiée ou une bibliothèque logicielle de haute précision ?
4. Quelle hiérarchie de caches et quel accès à la HBM4 retenir ?
5. Comment isoler les charges scientifiques des charges IA CPL3A ?
6. Quelle pile logicielle et quelles API exposer aux développeurs ?
7. Comment mesurer les performances, la consommation et la fiabilité sur prototypes ?

# Intégration au projet OpenAI 2027

Dans le scénario de partenariat **OpenAI × Logiix**, Vortex HPC pourrait être étudié pour les simulations scientifiques, la visualisation 3D et les charges hybrides IA/HPC. **Cette intégration est une proposition de projet**, distincte des spécifications de la fiche Pythagore; elle ne constitue ni un accord commercial réel ni une capacité matériellement démontrée.

# Référence documentaire

- *LOGIIX_LNX-3_Pythagore_Datasheet_Rev0.5.pdf*, révision 0.5, 16 novembre 2026, principalement section « LNX-3 PYTHAGORE / 06 — Vortex HPC — Calcul général et scientifique » et sections de topologie et de comparaison Oracle/Pythagore.
