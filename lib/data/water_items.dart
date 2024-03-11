import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/gen/assets.gen.dart';


final waterLevelItems = [
  ItemModel(
    name: 'Algae',
    color: Colors.brown.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Algae',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Rain',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Rain',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Water Drops',
    color: Colors.cyan.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Sand',
    color: Colors.brown.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Gravel',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
  ),
  ItemModel(
    name: 'Stone',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
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