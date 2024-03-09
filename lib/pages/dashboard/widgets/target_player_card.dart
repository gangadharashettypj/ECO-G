import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/gen/assets.gen.dart';

class TargetPlayerCard extends StatelessWidget {
  const TargetPlayerCard({
    super.key,
    this.color = Colors.red,
    this.opacity = 0.7,
  });

  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, candidateItems, rejectedItems) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: color.withOpacity(opacity),
                width: 10,
              ),
            ),
            height: 100,
            width: 100,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(opacity),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: 50,
              ),
            ),
          ),
        );
      },
    );
  }
}

class TargetPlayerCard1 extends StatelessWidget {
  const TargetPlayerCard1({
    super.key,
    this.color = Colors.red,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, candidateItems, rejectedItems) {
        return Center(
          child: Center(
            child: ImageWidget(
              imageLocation: Assets.images.person.path,
              height: 100,
              width: 100,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
