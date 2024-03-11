import 'package:flutter/material.dart';
import 'package:flutter_game/data/recycle.dart';
import 'package:flutter_game/data/solar_items.dart';
import 'package:flutter_game/data/tree_items.dart';
import 'package:flutter_game/data/water_items.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final levelData = [
  LevelDataModel(
    id: 'LEVEL_1',
    image: Assets.images.treeBg.path,
    title: 'Tree Building',
    concept: 'You will learn how to build a tree.',
    levelNumber: 1,
    color: Colors.greenAccent.toHex(),
    items: treeLevelItems,
  ),
  LevelDataModel(
    id: 'LEVEL_2',
    image: Assets.images.solarPanel.path,
    title: 'Solar Light',
    concept: 'You will learn about how to build solar light.',
    levelNumber: 2,
    color: ColorName.copperGold.toHex(),
    items: solarLevelItems,
  ),
  LevelDataModel(
    id: 'LEVEL_3',
    image: Assets.images.waterBg.path,
    title: 'Water Filtration',
    concept: 'You will learn how to filter dirt water.',
    levelNumber: 3,
    color: ColorName.primaryDark.toHex(),
    items: waterLevelItems,
  ),
  LevelDataModel(
    id: 'LEVEL_4',
    image: Assets.images.recycleBg.path,
    title: 'Recycling',
    concept: 'You will learn how to filter dirt water.',
    levelNumber: 4,
    color: ColorName.accent.toHex(),
    items: recycleLevel,
  ),
];

final greenDoctorLevel = LevelDataModel(
  id: 'LEVEL_1',
  image: Assets.images.treeBg.path,
  title: 'Green Doctor',
  concept: 'You will learn how to build a tree.',
  levelNumber: 1,
  color: Colors.greenAccent.toHex(),
  items: treeLevelItems,
);

final waterLevel = LevelDataModel(
  id: 'LEVEL_3',
  image: Assets.images.waterBg.path,
  title: 'Thirsty',
  concept: 'You will learn how to filter dirt water.',
  levelNumber: 3,
  color: ColorName.primaryDark.toHex(),
  items: waterLevelItems,
);

final renewableLevel = LevelDataModel(
  id: 'LEVEL_2',
  image: Assets.images.solarPanel.path,
  title: 'Renewable Energy',
  concept: 'You will learn about how to build solar light.',
  levelNumber: 2,
  color: ColorName.copperGold.toHex(),
  items: solarLevelItems,
);
