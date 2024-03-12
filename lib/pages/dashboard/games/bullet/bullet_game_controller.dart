import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/extension/list_extension.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/generator_util.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/utils/widget_position_utill.dart';
import 'package:signals/signals.dart';

class BulletGameController {
  final dragRegion = GlobalKey();

  final objects = signal<List<DragObject>>([]);

  Size dragRegionSize = const Size(0, 0);

  Timer? timer;

  Timer? timer1;

  final player1Points = signal<int>(0);

  final player2Points = signal<int>(0);

  final timeInSeconds = signal<int>(30);

  Color get getPlayer2Color {
    if (player1Points.value == player2Points.value) {
      return ColorName.textDarkColor;
    }
    if (player2Points.value > player1Points.value) {
      return Colors.green;
    }
    return Colors.red;
  }

  Color get getPlayer1Color {
    if (player1Points.value == player2Points.value) {
      return ColorName.textDarkColor;
    }
    if (player1Points.value > player2Points.value) {
      return Colors.green;
    }
    return Colors.red;
  }

  void init() {
    var items = List.generate(
            20,
            (index) => gameStoreInstance.selectedGame.value!.getDragObjects[
                index %
                    gameStoreInstance
                        .selectedGame.value!.getDragObjects.length])
        .where((element) => element.item.keyType == ItemType.positive)
        .map((e) => e.toJson())
        .toList();
    timeInSeconds.value = items.length * 2;

    final formattedItems = items.map((e) => DragObject.fromJson(e)).toList();

    formattedItems.shuffle();

    final randomItems = List.generate(formattedItems.length, (index) => index)
        .pickRandomItemsAsList(formattedItems.length ~/ 2);

    for (var element in randomItems) {
      formattedItems[element].item.viewType = ViewType.coin;
    }

    for (int i = 0; i < formattedItems.length; i++) {
      formattedItems[i].visibleTime =
          DateTime.now().millisecondsSinceEpoch + (i * 2000);
    }
    objects.value = formattedItems;
  }

  void postInit() {
    dragRegionSize = getSize(dragRegion);
    addRandomStartPositionForObjects(
      screenWidth: dragRegionSize.width,
      screenHeight: dragRegionSize.height,
      collectibles: objects.value,
    );

    timer1 = Timer.periodic(const Duration(seconds: 1), (timer) {
      final elapsed = 30 - timer.tick;
      if (elapsed >= 0) {
        timeInSeconds.value = elapsed;
      }
    });

    timer = Timer.periodic(
      Duration(milliseconds: refreshTime),
      (timer) {
        for (var element in objects.value) {
          element.updateActualPosition();
        }
        objects.value =
            objects.value.map((e) => DragObject.fromJson(e.toJson())).toList();
      },
    );
  }

  void dispose() {
    timer?.cancel();
    timer1?.cancel();
  }

  void updateScore() {
    final player1Items = objects.value
        .where((element) => element.ownBy == 1)
        .map((e) => e.score);
    if (player1Items.isNotEmpty) {
      player1Points.value =
          player1Items.reduce((value, element) => value + element);
    }

    final player2Items = objects.value
        .where((element) => element.ownBy == 2)
        .map((e) => e.score);
    if (player2Items.isNotEmpty) {
      player2Points.value =
          player2Items.reduce((value, element) => value + element);
    }
  }

  (int, int) getPointsStats(int playerIndex) {
    final rights = objects.value
        .where((element) => element.ownBy == playerIndex && element.score == 1)
        .length;
    final wrongs = objects.value
        .where((element) => element.ownBy == playerIndex && element.score == -1)
        .length;

    return (rights, wrongs);
  }
}
