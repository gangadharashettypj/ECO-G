import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final treeLevelItems = [
  ItemModel(
    name: 'Soil',
    color: Colors.brown.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.soil.path
  ),
  ItemModel(
    name: 'Water',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.rain.path
  ),
  ItemModel(
    name: 'Water',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.rain2.path
  ),
  ItemModel(
    name: 'Water Can',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.wateringCan.path
  ),
  ItemModel(
    name: 'Water',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.waterDrops2.path
  ),
  ItemModel(
    name: 'Tree',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.tree2.path
  ),
  ItemModel(
    name: 'Tree',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.tree5.path
  ),
  ItemModel(
    name: 'Tree',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.tree6.path
  ),
  ItemModel(
    name: 'Seed',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.seed.path
  ),
  ItemModel(
    name: 'Seed',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.seedUnderground.path
  ),
  ItemModel(
    name: 'Seed',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.sunflowerSeed.path
  ),
  ItemModel(
    name: 'Sunlight',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.sun2.path
  ),

  //negative Values

  ItemModel(
      name: 'Tree Cutting',
      color: Colors.brown.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.treeCutting.path
  ),
  ItemModel(
      name: 'Tree Cutting',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.treeCutting2.path
  ),
  ItemModel(
      name: 'Pesticides',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.toxicWaste2.path
  ),
  ItemModel(
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry.path
  ),
  ItemModel(
      name: 'Wild Fire',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.wildFire.path
  ),
  ItemModel(
      name: 'Extreme Heat',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.extremeTemp.path
  ),
  ItemModel(
      name: 'Sand',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.sand.path
  ),
];