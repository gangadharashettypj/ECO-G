import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:flutter_game/pages/dashboard/generator_util.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/pages/dashboard/widgets/collected_item_indicator.dart';
import 'package:flutter_game/pages/dashboard/widgets/drag_object_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/game_options_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/target_player_card.dart';
import 'package:flutter_game/utils/widget_position_utill.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GlobalKey dragRegion = GlobalKey();

  List<DragObject> objects = [];

  Size dragRegionSize = const Size(0, 0);

  Timer? timer;

  @override
  void initState() {
    objects = gameStoreInstance.selectedGame.value!.getDragObjects
        .map((e) => e.toJson())
        .map((e) => DragObject.fromJson(e))
        .toList();

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
      backgroundColor: ColorName.background,
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
              child: Column(
                children: [
                  Row(
                    children:
                        gameStoreInstance.selectedGame.value!.items.reversed
                            .map(
                              (e) => Expanded(
                                child: CollectedItemIndicator(
                                  color: HexColor.fromHex(e.color),
                                  reversed: true,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  const Gap.h8(),
                  const TargetPlayerCard(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const TargetPlayerCard(
                    color: Colors.red,
                  ),
                  const Gap.h8(),
                  Row(
                    children: gameStoreInstance.selectedGame.value!.items
                        .map(
                          (e) => Expanded(
                            child: CollectedItemIndicator(
                              color: HexColor.fromHex(e.color),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Row(
            //     children: gameStoreInstance.selectedGame.value!.items
            //         .map(
            //           (e) => Expanded(
            //             child: CollectedItemIndicator(
            //               color: HexColor.fromHex(e.color),
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            const Positioned.fill(
              child: GameOptionsView(),
            ),
          ],
        ),
      ),
    );
  }
}
