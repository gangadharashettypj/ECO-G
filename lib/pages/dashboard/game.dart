import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/models/level_data_model.dart';
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
  final GlobalKey _draggableKey = GlobalKey();
  final GlobalKey dragRegion = GlobalKey();

  DragObject dragObject = DragObject(
    id: 123,
    width: 100,
    height: 200,
  );

  Offset dragRegionBoundary = const Offset(0, 0);
  Size dragRegionsize = const Size(0, 0);

  EdgeInsets? padding;
  Timer? timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        final size = MediaQuery.sizeOf(context);
        padding = MediaQuery.paddingOf(context);
        final y = size.height * 0.5 - dragObject.height * 0.5 - padding!.top;
        final x = size.width * 0.5 - dragObject.width * 0.5;
        dragObject.rootPosition = Offset(x, y);
        dragObject.targetPosition = Offset(x, y);
      });

      dragRegionBoundary = getPosition(dragRegion);
      dragRegionsize = getSize(dragRegion);
    });

    timer = Timer.periodic(
      Duration(milliseconds: refreshTime),
      (timer) {
        if (dragObject.updateActualPosition()) {
          setState(() {});
        }
      },
    );
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
            Positioned(
              left: dragObject.rootPosition.dx,
              top: dragObject.rootPosition.dy,
              child: Draggable(
                key: _draggableKey,
                hitTestBehavior: HitTestBehavior.translucent,
                feedback: Container(),
                ignoringFeedbackPointer: false,
                maxSimultaneousDrags: 2,
                dragAnchorStrategy: childDragAnchorStrategy,
                data: DateTime.now().millisecondsSinceEpoch,
                onDragUpdate: (dragDetails) {
                  double x =
                      dragDetails.localPosition.dx - dragObject.tapOffset.dx;
                  double y =
                      dragDetails.localPosition.dy - dragObject.tapOffset.dy;

                  if (y < 0) {
                    y = 0;
                  }

                  if (y + dragObject.height > dragRegionsize.height) {
                    y = dragRegionsize.height - dragObject.height;
                  }
                  dragObject.targetPosition = Offset(x, y);
                },
                onDragEnd: (details) {
                  setState(() {
                    dragObject.targetPosition = Offset(
                      dragObject.rootPosition.dx,
                      dragObject.rootPosition.dy,
                    );

                    if (dragObject.checkIsFirstPlayerWinner(dragRegionsize)) {
                      BotToast.showText(text: 'Winner is 1');
                    }

                    if (dragObject.checkIsSecondPlayerWinner(dragRegionsize)) {
                      BotToast.showText(text: 'Winner is 2');
                    }
                  });
                },
                child: GestureDetector(
                  onTapDown: (details) {
                    dragObject.tapOffset = details.localPosition;
                  },
                  child: Container(
                    height: dragObject.height.toDouble(),
                    width: 100,
                    color: Colors.green,
                  ),
                ),
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
                  if (dragObject.checkIsFirstPlayerWinner(dragRegionsize)) {
                    BotToast.showText(text: 'Winner is 1');
                  }
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
                  if (dragObject.checkIsSecondPlayerWinner(dragRegionsize)) {
                    BotToast.showText(text: 'Winner is 2');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
