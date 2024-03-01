import 'package:flutter/material.dart';

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
