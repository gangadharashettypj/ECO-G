import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final levelData = [
  LevelDataModel(
    id: 'LEVEL_1',
    image: Assets.images.tree.path,
    title: 'Tree Building',
    concept: 'You will learn how to build a tree.',
    levelNumber: 1,
    color: Colors.greenAccent.toHex(),
    items: [
      ItemModel(name: 'Soil', color: Colors.brown.toHex()),
      ItemModel(name: 'Water', color: Colors.cyan.toHex()),
      ItemModel(name: 'Seeds', color: Colors.green.toHex()),
    ],
  ),
  LevelDataModel(
    id: 'LEVEL_2',
    image: Assets.images.solarPanel.path,
    title: 'Solar Light',
    concept: 'You will learn about how to build solar light.',
    levelNumber: 2,
    color: ColorName.copperGold.toHex(),
    items: [
      ItemModel(name: 'Solar Panel', color: Colors.blueGrey.toHex()),
      ItemModel(name: 'Sun light', color: Colors.orangeAccent.toHex()),
      ItemModel(name: 'LED', color: Colors.grey.toHex()),
    ],
  ),
  LevelDataModel(
    id: 'LEVEL_3',
    image: Assets.images.water.path,
    title: 'Water Filtration',
    concept: 'You will learn how to filter dirt water.',
    levelNumber: 3,
    color: ColorName.primaryDark.toHex(),
    items: [
      ItemModel(name: 'Sand', color: Colors.brown.toHex()),
      ItemModel(name: 'Gravel', color: Colors.grey.toHex()),
      ItemModel(name: 'Stone', color: Colors.blueGrey.toHex()),
    ],
  ),
];
