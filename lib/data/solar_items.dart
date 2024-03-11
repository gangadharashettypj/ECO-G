import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final solarLevelItems = [
  ItemModel(
    name: 'Solar Panel',
    color: Colors.blueGrey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.sunSolarPanal.path
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
    name: 'LED',
    color: Colors.grey.toHex(),
    keyType: ItemType.positive,
    image: Assets.playIcons.bulb.path
  ),

  //negative Values

  ItemModel(
      name: 'Night',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.nightTime.path
  ),
  ItemModel(
      name: 'Moon',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.moonStar.path
  ),
  ItemModel(
      name: 'Cloud',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.clouds.path
  ),
  ItemModel(
      name: 'Bad Weather',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.cloudsLightning.path
  ),
  ItemModel(
      name: 'Rain',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.rain.path
  ),
  ItemModel(
      name: 'Rain',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.rain2.path
  ),
  ItemModel(
      name: 'Rain',
      color: Colors.cyan.toHex(),
      keyType: ItemType.negative,
      image: Assets.playIcons.rainSun.path
  ),
];