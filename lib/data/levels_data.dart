import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/utils/random_colors.dart';

final levelData = [
  LevelDataModel(
    id: 'LEVEL_1',
    title: 'Tree Building',
    concept: 'You will learn how to build a tree.',
    levelNumber: 1,
    itemImages: [],
    color: randomColors[0],
    itemNames: [
      'Soil',
      'Water',
      'Seeds',
      'Pot',
    ],
  ),
  LevelDataModel(
    id: 'LEVEL_2',
    title: 'Solar Light',
    concept: 'You will learn about how to build solar light.',
    levelNumber: 2,
    itemImages: [],
    color: randomColors[1],
    itemNames: [
      'Solar Panel',
      'Sun light',
      'Lights',
      'Wires',
    ],
  ),
  LevelDataModel(
    id: 'LEVEL_3',
    title: 'Tree Building',
    concept: 'You will learn how to build a tree.',
    levelNumber: 3,
    itemImages: [],
    color: randomColors[2],
    itemNames: [
      'Soil',
      'Water',
      'Seeds',
      'Pot',
    ],
  ),
];
