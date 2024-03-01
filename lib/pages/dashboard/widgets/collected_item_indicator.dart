import 'package:flutter/material.dart';
import 'package:flutter_game/gen/colors.gen.dart';

class CollectedItemIndicator extends StatelessWidget {
  const CollectedItemIndicator({
    super.key,
    this.color = Colors.green,
    this.progress = 0.2,
    this.reversed = false,
  });

  final Color color;
  final double progress;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 2),
      height: 20,
      child: RotatedBox(
        quarterTurns: reversed ? 2 : 0,
        child: LinearProgressIndicator(
          value: progress,
          color: color,
          backgroundColor: ColorName.background,
        ),
      ),
    );
  }
}
