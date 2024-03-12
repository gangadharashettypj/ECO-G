import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final ecoLife = [
  ItemModel(
    name: 'Solar Panel',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.solarPanel.path
  ),
  ItemModel(
    name: 'Solar Panel',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.solarPanel.path
  ),
  ItemModel(
    name: 'Solar Energy',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.solarEnergy.path
  ),
  ItemModel(
    name: 'Sun',
    color: Colors.orangeAccent.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.sun2.path
  ),
  ItemModel(
    name: 'Windmill',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.windmill.path
  ),
  ItemModel(
    name: 'Windmill',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.windmill2.path
  ),
  ItemModel(
    name: 'Eco-Fuel',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.ecoFuel.path
  ),
  ItemModel(
    name: 'Water Energy',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.water.path
  ),

  //negative Values

  ItemModel(
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry2.path
  ),
  ItemModel(
      name: 'Industry',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.industry3.path
  ),
  ItemModel(
      name: 'Plastic Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.palsticBag.path
  ),
  ItemModel(
      name: 'Plastic Bottle',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.plasticBottle.path
  ),
  ItemModel(
      name: 'Nuclear Waste',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.toxicWaste.path
  ),
  ItemModel(
      name: 'Toxic Waste',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.toxicWaste2.path
  ),
];