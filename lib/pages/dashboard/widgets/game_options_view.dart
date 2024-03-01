import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GameOptionsView extends StatelessWidget {
  const GameOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // const Positioned(
        //   left: 0,
        //   child: LabelWidget(
        //     'T1',
        //     color: Colors.white,
        //   ),
        // ),
        Positioned(
          right: 10,
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
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.pause,
                  color: Colors.white,
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
