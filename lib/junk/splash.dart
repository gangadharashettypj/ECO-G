import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 24),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          // child: ImageWidget(
          //   imageLocation: Assets.images.logo.path,
          //   width: 100,
          // ),
          child: LongPressDraggable(
            dragAnchorStrategy: pointerDragAnchorStrategy,
            data: DateTime.now().millisecondsSinceEpoch,
            delay: const Duration(milliseconds: 10),
            feedback: DraggingListItem(
              dragKey: _draggableKey,
            ),
            maxSimultaneousDrags: 1,
            onDragStarted: () {},
            onDragEnd: (detail) {},
            onDragCompleted: () {
              print('>>>>>> onDragCompleted');
            },
            onDraggableCanceled: (_, __) {
              print('>>>>>> onDraggableCanceled');
            },
            onDragUpdate: (details) {
              // print('>>>>>> onDragUpdate');
            },
            child: Container(
              height: 150,
              width: 150,
              color: Colors.green,
            ),
          ),
        ),
      ),
      bottomSheet: DragTarget<int>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
          );
        },
        onAcceptWithDetails: (details) {
          print(details.data);
        },
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
  });

  final GlobalKey dragKey;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: 0.85,
          child: Container(
            height: 150,
            width: 150,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
