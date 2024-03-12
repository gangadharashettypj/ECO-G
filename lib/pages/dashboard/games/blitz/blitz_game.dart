import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/games/blitz/blitz_game_controller.dart';
import 'package:flutter_game/pages/dashboard/games/blitz/blitz_rewards.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/pages/dashboard/widgets/drag_object_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/game_options_view.dart';
import 'package:flutter_game/pages/dashboard/widgets/target_player_card.dart';
import 'package:flutter_game/utils/store_helper.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class BlitzGameScreen extends StatefulWidget {
  const BlitzGameScreen({super.key});

  @override
  State<BlitzGameScreen> createState() => _BlitzGameScreenState();
}

class _BlitzGameScreenState extends State<BlitzGameScreen> {
  final controller = BlitzGameController();

  final List<VoidCallback> _disposers = [];

  @override
  void initState() {
    controller.init();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.postInit();
    });

    _disposers.add(effect(() {
      if (controller.timeInSeconds.value == 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlitzRewardsScreen(controller: controller);
          },
          barrierDismissible: false,
        );
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
                    return Row(
                      children: [
                        LabelWidget(
                          controller.player1Points.value.toString(),
                          fontSize: 38,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8, left: 8),
                          child: LabelWidget(
                            gameStoreInstance.firstPlayer.value?.name ?? '',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Watch(
                  (context) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LabelWidget(
                          controller.player2Points.value.toString(),
                          fontSize: 38,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8, left: 8),
                          child: LabelWidget(
                            gameStoreInstance.secondPlayer.value?.name ?? '',
                          ),
                        ),
                      ],
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
