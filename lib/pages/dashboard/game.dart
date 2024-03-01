import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/data/game_type_data.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/generator_util.dart';
import 'package:flutter_game/pages/dashboard/widgets/drag_object_view.dart';
import 'package:flutter_game/utils/widget_position_utill.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.selectedGame,
  });

  final LevelDataModel selectedGame;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GlobalKey dragRegion = GlobalKey();

  // DragObject dragObject = DragObject(
  //   id: 123,
  //   width: 100,
  //   height: 200,
  // );

  List<DragObject> objects = objectData;

  Size dragRegionSize = const Size(0, 0);

  Timer? timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dragRegionSize = getSize(dragRegion);
      addRandomStartPositionForObjects(
        screenWidth: dragRegionSize.width,
        screenHeight: dragRegionSize.height,
        collectibles: objects,
      );

      timer = Timer.periodic(
        Duration(milliseconds: refreshTime),
        (timer) {
          objects
              .map((e) => e.updateActualPosition())
              .where((element) => element)
              .isNotEmpty;
          if (objects.where((element) => element.ownBy == 0).isEmpty) {
            context.popRoute();
          } else {
            setState(() {});
          }
        },
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          key: dragRegion,
          children: [
            ...objects.map(
              (dragObject) => DragObjectView(
                dragObject: dragObject,
                size: dragRegionSize,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: DragTarget<int>(
                builder: (context, candidateItems, rejectedItems) {
                  return Container(
                    color: Colors.orange.withOpacity(0.7),
                    height: 100,
                    width: double.infinity,
                  );
                },
                onAcceptWithDetails: (details) {
                  // if (dragObject.checkIsFirstPlayerWinner(dragRegionsize)) {
                  //   BotToast.showText(text: 'Winner is 1');
                  // }
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DragTarget<int>(
                builder: (context, candidateItems, rejectedItems) {
                  return Container(
                    color: Colors.red.withOpacity(0.7),
                    height: 100,
                    width: double.infinity,
                  );
                },
                onAcceptWithDetails: (details) {
                  // if (dragObject.checkIsSecondPlayerWinner(dragRegionsize)) {
                  //   BotToast.showText(text: 'Winner is 2');
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
