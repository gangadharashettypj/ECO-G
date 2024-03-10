import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.item,
    required this.score,
    this.color = ColorName.primary,
  });

  final Color color;
  final int score;
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
            ),
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ImageWidget(
            imageLocation: item.image,
            width: 60,
            height: 60,
          ),
        ),
        LabelWidget(
          '  x $score',
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
