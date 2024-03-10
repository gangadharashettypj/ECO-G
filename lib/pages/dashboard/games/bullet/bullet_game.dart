import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game_controller.dart';
import 'package:flutter_game/pages/dashboard/widgets/drag_object_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/game_options_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/target_player_card.dart';
import 'package:flutter_game/routes/app_router.dart';
import 'package:flutter_game/utils/store_helper.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class BulletGameScreen extends StatefulWidget {
  const BulletGameScreen({super.key});

  @override
  State<BulletGameScreen> createState() => _BulletGameScreenState();
}

class _BulletGameScreenState extends State<BulletGameScreen> {
  final controller = BulletGameController();

  final List<VoidCallback> _disposers = [];

  @override
  void initState() {
    controller.init();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.postInit();
    });

    _disposers.add(effect(() {
      if (controller.timeInSeconds.value == 0) {
        context.router.replace(BulletRewardsRoute(controller: controller));
      }
      if (controller.objects.value
          .where((element) => element.ownBy == 0)
          .isEmpty) {
        context.router.replace(BulletRewardsRoute(controller: controller));
      }
    }));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    disposeStore(_disposers);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            key: controller.dragRegion,
            children: [
              Positioned(
                left: -12,
                right: -12,
                bottom: 0,
                top: 0,
                child: PaperCard(
                  child: Container(),
                ),
              ),
              Positioned(
                left: 40,
                right: 40,
                bottom: 0,
                top: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        height: 8,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                          width: 8,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 70,
                      width: 70,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        height: 8,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -10,
                bottom: 0,
                top: 0,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Watch(
                      (context) {
                        return LabelWidget(
                          DateTime.fromMillisecondsSinceEpoch(
                            controller.timeInSeconds.value * 1000,
                            isUtc: true,
                          ).format('mm:ss'),
                          fontSize: 30,
                          color: ColorName.textColor.withOpacity(0.5),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Watch(
                  (context) {
                    return Stack(
                      children: [
                        ...controller.objects.value.map(
                          (dragObject) => DragObjectView(
                            dragObject: dragObject,
                            size: controller.dragRegionSize,
                            onItemReceived: (playerIndex) {
                              dragObject.ownBy = playerIndex;
                              controller.updateScore();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: TargetPlayerCard1(
                    color: Colors.blue,
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: TargetPlayerCard1(
                  color: Colors.red,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Watch(
                  (context) {
                    return LabelWidget(
                      controller.player1Points.value.toString(),
                      fontSize: 38,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Watch(
                  (context) {
                    return LabelWidget(
                      controller.player2Points.value.toString(),
                      fontSize: 38,
                    );
                  },
                ),
              ),
              const Positioned.fill(
                child: GameOptionsView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
