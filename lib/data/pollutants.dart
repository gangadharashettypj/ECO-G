import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final pollutants = [
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