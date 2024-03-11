import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/pages/dashboard/games/blitz/blitz_game_controller.dart';
import 'package:flutter_game/pages/dashboard/games/blitz/widgets/reward_card.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class BlitzRewardsScreen extends StatefulWidget {
  const BlitzRewardsScreen({
    super.key,
    required this.controller,
  });

  final BlitzGameController controller;

  @override
  State<BlitzRewardsScreen> createState() => _BlitzRewardsScreenState();
}

class _BlitzRewardsScreenState extends State<BlitzRewardsScreen> {
  BlitzGameController get controller => widget.controller;

  Widget buildPlayer1Rewards(int playerIndex) {
    return Column(
      children: gameStoreInstance.selectedGame.value!.getDragObjects.map(
        (e) {
          final selectedItems = controller.objects.value
              .where((element) =>
                  element.ownBy == playerIndex &&
                  element.item.name == e.item.name)
              .map((e1) => e1.score)
              .toList();
          int score = 0;
          if (selectedItems.isNotEmpty) {
            score = selectedItems.reduce((value, element) => value + element);
          }
          return BlitzRewardCard(
            item: e.item,
            score: score,
            color: gameStoreInstance.selectedGame.value!.formattedColor
                .withOpacity(0.6),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      backgroundColor:
          gameStoreInstance.selectedGame.value!.formattedColor.withOpacity(0.2),
      borderColor: gameStoreInstance.selectedGame.value!.formattedColor,
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: gameStoreInstance.selectedGame.value!.formattedColor,
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Watch(
            (context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap.h16(),
                    LabelWidget(
                      gameStoreInstance.selectedGame.value!.title,
                      color:
                          gameStoreInstance.selectedGame.value!.formattedColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      textAlign: TextAlign.center,
                    ),
                    const Gap.h16(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: gameStoreInstance
                              .selectedGame.value!.formattedColor
                              .withOpacity(0.5),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: gameStoreInstance
                                          .selectedGame.value!.formattedColor
                                          .withOpacity(0.8),
                                    ),
                                    const Gap.w4(),
                                    LabelWidget(
                                      gameStoreInstance
                                              .firstPlayer.value?.name ??
                                          '',
                                      color: gameStoreInstance
                                          .selectedGame.value!.formattedColor
                                          .withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: gameStoreInstance
                                          .selectedGame.value!.formattedColor
                                          .withOpacity(0.8),
                                    ),
                                    const Gap.w4(),
                                    LabelWidget(
                                      gameStoreInstance
                                              .secondPlayer.value?.name ??
                                          '',
                                      color: gameStoreInstance
                                          .selectedGame.value!.formattedColor
                                          .withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Gap.h16(),
                          SizedBox(
                            height: 400,
                            child: SingleChildScrollView(
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    buildPlayer1Rewards(1),
                                    VerticalDivider(
                                      color: gameStoreInstance
                                          .selectedGame.value!.formattedColor
                                          .withOpacity(0.6),
                                    ),
                                    buildPlayer1Rewards(2),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
