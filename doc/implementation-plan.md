# Krastorio2 Sentinel Research Notes

## Overview

Sentinel (`kr-sentinel`) is a small radar entity added by Krastorio2.
It continuously monitors a small nearby area at low power consumption. Unlike the vanilla radar, it does not perform long-range scanning, but is cheap and compact.

## Prototype Definition

- **Internal name**: `kr-sentinel`
- **Type**: `radar` (uses Factorio's radar prototype)
- **Size**: 1x1 tile (collision_box: 0.5x0.5)
- **HP**: 75
- **Power consumption**: 40kW
- **Nearby scan range**: 1 chunk (`max_distance_of_nearby_sector_revealed = 1`)
- **Sector scan range**: 0 chunks (`max_distance_of_sector_revealed = 0`)
- **Sector scan cost**: 1YJ (effectively infinite = no sector scanning)
- **Resistances**: fire 50%, impact 10%
- **Item subgroup**: `kr-radar` (within the combat group)
- **Stack size**: 50

## Recipe

- **Crafting time**: 5 seconds
- **Ingredients**: kr-glass x1, iron-plate x2, copper-cable x1, kr-automation-core x1

## Radar Entity Comparison

| Property | Sentinel | Radar (vanilla) | Radar (K2 modified) | Advanced Radar |
|---|---|---|---|---|
| Size | 1x1 | 3x3 | 3x3 | 3x3 |
| HP | 75 | 250 | 300 | 350 |
| Power consumption | 40kW | 300kW | 1MW | 2MW |
| Nearby scan range | 1 chunk | 3 chunks | 5 chunks | 8 chunks |
| Sector scan range | none | 14 chunks | 16 chunks | 20 chunks |
| Sector scan cost | - | 10MJ/sector | 2MJ/sector | 2MJ/sector |
| Resistances (fire/impact) | 50%/10% | 70%/30% | 70%/30% | 80%/50% |
| fast_replaceable_group | none | radar | radar | radar |

K2 buffs the vanilla radar (power 300kW to 1MW, nearby 3 to 5 chunks, sector 14 to 16 chunks).
Sentinel takes the opposite approach: no sector scanning, monitoring only 1 nearby chunk.

## Technology Tree Impact

K2 restructures the radar-related technology tree.

```
lamp
 └─ kr-sentinel (automation-science-pack era)
      └─ radar (pushed back to chemical-science-pack era)
           └─ kr-advanced-radar (utility-science-pack era)
```

- **kr-sentinel technology**
  - Prerequisites: `lamp`
  - Science packs: kr-basic-tech-card x1, automation-science-pack x1
  - Research cost: 100 units x 30 seconds
  - Effect: unlocks kr-sentinel recipe

- **radar technology (K2 modified)**
  - Prerequisites: `chemical-science-pack`, `kr-sentinel`
  - In vanilla, radar is unlocked with automation-science-pack; K2 pushes it back to the chemical-science-pack era

- **kr-advanced-radar technology**
  - Prerequisites: `radar`, `utility-science-pack`

In a K2 environment, Sentinel is the only map visibility tool available in the early game.

## k2-sentinel MOD Plan

### Technology

Largely follows K2's technology tree restructuring.

**kr-sentinel technology (new)**
- Prerequisites: `lamp`
- Science packs: automation-science-pack x1 (K2's kr-basic-tech-card is not used)
- Effect: unlocks kr-sentinel recipe

**Radar technology (modified)**
- Prerequisites: `chemical-science-pack`, kr-sentinel technology (vanilla only requires `automation-science-pack`)
- Science packs: automation-science-pack x1, logistic-science-pack x1, chemical-science-pack x1
- Research cost: 200 units x 30 seconds (vanilla: 20 units x 10 seconds)

```
Vanilla: automation-science-pack → radar

This MOD: lamp → kr-sentinel → radar (pushed back to chemical-science-pack era)
```

### Recipes

Forms a material chain: lamp → kr-sentinel → radar.

**kr-sentinel recipe (new)**
- small-lamp x1
- electronic-circuit x1
- iron-plate x1
- Crafting time: 5 seconds

**Radar recipe (modified)**
- kr-sentinel x1
- electronic-circuit x3
- iron-gear-wheel x5
- iron-plate x5
- Crafting time: follows vanilla

```
Material chain:
  small-lamp → kr-sentinel → radar

Effective cost comparison:
  kr-sentinel: electronic-circuit x2, copper-cable x3, iron-plate x2
  radar:       electronic-circuit x5, copper-cable x3, iron-gear-wheel x5, iron-plate x7
```

### Radar Entity Stats Modification

Adopts K2's radar modifications as-is. Sentinel handles local visibility; radar handles sector scanning. Role separation.

| Property | Vanilla | This MOD |
|---|---|---|
| HP | 250 | 300 |
| Power consumption | 300kW | 1MW |
| Nearby scan range | 3 chunks | 5 chunks |
| Sector scan range | 14 chunks | 16 chunks |
| Sector scan cost | 10MJ/sector | 2MJ/sector |

### Item Subgroup

Sentinel is placed in the vanilla `defensive-structure` subgroup (combat group), same as radar.

### Relationship with K2

Incompatible with K2. The following entries are added to `info.json` `dependencies`:
- `! Krastorio2`
- `! Krastorio2-spaced-out`

### Localization

Copy kr-sentinel related locale entries from all 30 languages in Krastorio2. Entries span:
- `entity-name` / `item-description` for kr-sentinel
- `technology-name` / `technology-description` for kr-sentinel
- `achievement-name` / `achievement-description` for kr-big-brother-is-watching-you (partial coverage)

### Assets

Only the required files are copied from Krastorio2Assets and bundled with this MOD.
Depending on Krastorio2Assets would force a large download for a single entity.

### License

Change the project license to LGPL v3 (currently MIT).
Both Krastorio2 and Krastorio2Assets are LGPL v3, and assets are copied into this project.

### Achievement

Add a `build-entity-achievement` named `kr-big-brother-is-watching-you` for building 100 sentinels. Uses `to_build = "kr-sentinel"` and `amount = 100`. Achievement icon assets need to be copied from Krastorio2Assets.

### TODO

- Make kr-sentinel obtainable from crash site wreckage. The leading approach is to use the freeplay scenario's remote interface (`freeplay_interface`) to add kr-sentinel to `crashed_debris_items` via `control.lua`'s `on_init`.
- Space Age compatibility: conditionally add `heating_energy` and `frozen_patch` to the kr-sentinel entity when Space Age is present (`if mods["space-age"]`).

## Other (K2 Reference Information)

- **Achievement**: "kr-big-brother-is-watching-you" — build 100 sentinels
- **Crash site (main ship)**: guaranteed drop of 1-3 sentinels when mined
- **Crash site (small/medium wreckage)**: 10% chance of dropping 0-3 sentinels (crash-site-chest-1/2, wreck-medium-1 to 3)
- **squeak-through-2 compatibility**: squeak behavior disabled
