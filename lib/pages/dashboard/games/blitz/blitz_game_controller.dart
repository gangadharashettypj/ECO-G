import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/pages/dashboard/generator_util.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/utils/widget_position_utill.dart';
import 'package:signals/signals.dart';

class BlitzGameController {
  final dragRegion = GlobalKey();

  final objects = signal<List<DragObject>>([]);

  Size dragRegionSize = const Size(0, 0);

  Timer? timer;

  Timer? timer1;

  final player1Points = signal<int>(0);

  final player2Points = signal<int>(0);

  final timeInSeconds = signal<int>(60);

  void init() {
    var items = gameStoreInstance.selectedGame.value!.getDragObjects
        .map((e) => e.toJson())
        .toList();

    timeInSeconds.value = items.length * 2;

    final formattedItems = items.map((e) => DragObject.fromJson(e)).toList();

    formattedItems.shuffle();
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
      if (timeInSeconds.value >= 0) {
        timeInSeconds.value = timeInSeconds.value - 1;
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
}
