import 'dart:ui';

import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/models/level_data_model.dart';

final gameTypeData = [
  GameTypeModel(
    id: 'LEVEL_1',
    title: 'Tree Building',
    concept: 'You will learn how to build a tree.',
    objectType: ObjectType.words,
    variantType: VariantType.rapid,
  ),
];

final objectData = [
  DragObject(
    id: 123,
    size: const Size(150, 100),
    text: 'SEEDS',
  ),
  DragObject(
    id: 124,
    size: const Size(150, 100),
    text: 'SEEDS',
  ),
  DragObject(
    id: 125,
    size: const Size(150, 100),
    text: 'WATER',
  ),
  DragObject(
    id: 126,
    size: const Size(150, 100),
    text: 'SOIL',
  ),
  DragObject(
    id: 127,
    size: const Size(150, 100),
    text: 'WATER',
  ),
  DragObject(
    id: 128,
    size: const Size(150, 100),
    text: 'WATER',
  ),
];
