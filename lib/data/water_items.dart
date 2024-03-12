import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/gen/assets.gen.dart';


final waterLevelItems = [
  ItemModel(
    name: 'Algae',
    color: Colors.brown.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.algae1.path
  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.algae2.path

  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.algae4.path

  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.algae6.path

  ),
  ItemModel(
    name: 'Rain',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.rain.path

  ),
  ItemModel(
    name: 'Rain',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.rainSun.path

  ),
  ItemModel(
    name: 'Water Drops',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.waterDrops2.path

  ),
  ItemModel(
    name: 'Sand',
    color: Colors.brown.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.sand.path

  ),
  ItemModel(
    name: 'Stone',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
      image: Assets.playIcons.gravel.path

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
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry.path
  ),
  ItemModel(
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry.path
  ),
  ItemModel(
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry3.path
  ),
  ItemModel(
      name: 'Toxic Waste',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.toxicWaste.path
  ),
];