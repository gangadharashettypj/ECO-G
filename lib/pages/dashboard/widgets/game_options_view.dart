import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GameOptionsView extends StatelessWidget {
  const GameOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: InkWell(
              onTap: () {
                context.popRoute();
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.stop,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
