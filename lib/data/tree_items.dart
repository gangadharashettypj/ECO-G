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
      name: 'Plastic Bottle',
      color: Colors.brown.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.plasticBottle.path
  ),
  ItemModel(
      name: 'Plastic Cup',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.plasticCup.path
  ),
  ItemModel(
      name: 'Garbage',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.garbageBag.path
  ),
  ItemModel(
      name: 'Plastic Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.palsticBag.path
  ),
  ItemModel(
      name: 'Plastic Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.plasticBag2.path
  ),
  ItemModel(
      name: 'Plastic Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.plasticBag3.path
  ),
];