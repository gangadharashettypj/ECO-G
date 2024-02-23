import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey _draggableKey = GlobalKey();
  final GlobalKey firstPlayer = GlobalKey();
  final GlobalKey secondPlayer = GlobalKey();

  double _x = 0;
  double _y = 0;

  double actualX = 0;
  double actualY = 0;

  final moneyHeight = 200;
  final moneyWidth = 100;

  Offset tapOffset = Offset(0, 0);
  Offset firstPlayerBoundary = Offset(0, 0);
  Offset secondPlayerBoundary = Offset(0, 0);

  Timer? timer;

  final deltaUpdatePX = 2;
  final refreshTime = 10;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        actualY = MediaQuery.sizeOf(context).height * 0.5 -
            moneyHeight * 0.5 -
            MediaQuery.paddingOf(context).top;
        actualX = MediaQuery.sizeOf(context).width * 0.5 - moneyWidth * 0.5;
        _x = actualX;
        _y = actualY;
      });
      RenderBox box =
          firstPlayer.currentContext?.findRenderObject() as RenderBox;
      firstPlayerBoundary = box.localToGlobal(Offset.zero);

      RenderBox box1 =
          secondPlayer.currentContext?.findRenderObject() as RenderBox;
      secondPlayerBoundary = box1.localToGlobal(Offset.zero);
    });
    timer = Timer.periodic(
      Duration(milliseconds: refreshTime),
      (timer) {
        bool refresh = false;

        if (actualX < _x) {
          refresh = true;
          if (_x - actualX < deltaUpdatePX) {
            actualX = _x;
          } else {
            actualX += deltaUpdatePX;
          }
        } else if (actualX > _x) {
          refresh = true;
          if (actualX - _x < deltaUpdatePX) {
            actualX = _x;
          } else {
            actualX -= deltaUpdatePX;
          }
        }
        if (actualY < _y) {
          refresh = true;
          if (_y - actualY < deltaUpdatePX) {
            actualY = _y;
          } else {
            actualY += deltaUpdatePX;
          }
        } else if (actualY > _y) {
          refresh = true;
          if (actualY - _y < deltaUpdatePX) {
            actualY = _y;
          } else {
            actualY -= deltaUpdatePX;
          }
        }

        if (refresh == true) {
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
          children: [
            Positioned(
              left: actualX,
              top: actualY,
              child: Draggable(
                key: _draggableKey,
                hitTestBehavior: HitTestBehavior.translucent,
                feedback: Container(),
                // feedback: buildFeedback(),
                ignoringFeedbackPointer: false,
                // childWhenDragging: Container(),
                maxSimultaneousDrags: 2,
                // dragAnchorStrategy: pointerDragAnchorStrategy,
                dragAnchorStrategy: childDragAnchorStrategy,
                data: DateTime.now().millisecondsSinceEpoch,
                onDragUpdate: (dragDetails) {
                  _x = dragDetails.localPosition.dx - tapOffset.dx;
                  _y = dragDetails.localPosition.dy - tapOffset.dy;

                  if (_y < 0) {
                    _y = 0;
                  }

                  if (_y + moneyHeight > secondPlayerBoundary.dy + 52) {
                    _y = secondPlayerBoundary.dy - 1 - moneyHeight + 52;
                  }
                },
                onDragEnd: (details) {
                  setState(() {
                    // actualX = details.offset.dx;
                    // actualY = details.offset.dy;
                    _x = actualX;
                    _y = actualY;
                  });
                },

                child: GestureDetector(
                  onTapDown: (details) {
                    tapOffset = details.localPosition;
                  },
                  child: Container(
                    height: moneyHeight.toDouble(),
                    width: 100,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Positioned(
              key: firstPlayer,
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
                  if (actualY < 100) {
                    BotToast.showText(text: 'Winner is 1');
                  }
                },
              ),
            ),
            Positioned(
              key: secondPlayer,
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
                  if ((actualY + moneyHeight) > secondPlayerBoundary.dy) {
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
