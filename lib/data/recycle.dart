import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final recycleLevel = [
  //biodegradable items
  ItemModel(
      name: 'Paper',
      color: Colors.brown.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.paper.path
  ),
  ItemModel(
      name: 'Egg Shells',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.eggshell.path
  ),
  ItemModel(
      name: 'Card Board',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.cardboardBox.path
  ),
  ItemModel(
      name: 'Paper Package',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.cardboardContainer.path
  ),
  ItemModel(
      name: 'Bone',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.bone.path
  ),
  ItemModel(
      name: 'Vegetables',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.vegetables.path
  ),
  ItemModel(
      name: 'Fruits',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.fruits.path
  ),
  ItemModel(
      name: 'Tree',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.tree6.path
  ),
  ItemModel(
      name: 'Paper Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.paperBag.path
  ),
  ItemModel(
      name: 'Wood',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.woods.path
  ),
  ItemModel(
      name: 'Wood',
      color: Colors.cyan.toHex(),
      keyType: ItemType.positive,
      image: Assets.playIcons.woods2.path
  ),

  //negative Values

  ItemModel(
      name: 'Car Battery',
      color: Colors.brown.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.carBattery.path
  ),
  ItemModel(
      name: 'Laptop',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.laptop.path
  ),
  ItemModel(
      name: 'Mobile',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.mobile.path
  ),
  ItemModel(
      name: 'Battery',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.battery.path
  ),
  ItemModel(
      name: 'Soda Can',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.tinCan.path
  ),
  ItemModel(
      name: 'Tin Can',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.tin.path
  ),
  ItemModel(
      name: 'Plastic Bag',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.palsticBag.path
  ),
  ItemModel(
      name: 'Glass Bottle',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.glassBottle2.path
  ),
  ItemModel(
      name: 'Cement',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.cement.path
  ),
  ItemModel(
      name: 'Glass Bottle',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.toxicWaste2.path
  ),
];