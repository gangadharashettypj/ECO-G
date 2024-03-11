import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game_controller.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/widgets/reward_card.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class BulletRewardsScreen extends StatefulWidget {
  const BulletRewardsScreen({
    super.key,
    required this.controller,
  });

  final BulletGameController controller;

  @override
  State<BulletRewardsScreen> createState() => _BulletRewardsScreenState();
}

class _BulletRewardsScreenState extends State<BulletRewardsScreen> {
  BulletGameController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      backgroundColor:
          gameStoreInstance.selectedGameMode.value.color.withOpacity(0.2),
      borderColor: gameStoreInstance.selectedGameMode.value.color,
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: gameStoreInstance.selectedGameMode.value.color,
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
                      color: gameStoreInstance.selectedGameMode.value.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      textAlign: TextAlign.center,
                    ),
                    const Gap.h16(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: gameStoreInstance.selectedGameMode.value.color
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
                                          .selectedGameMode.value.color
                                          .withOpacity(0.8),
                                    ),
                                    const Gap.w4(),
                                    LabelWidget(
                                      gameStoreInstance
                                              .firstPlayer.value?.name ??
                                          '',
                                      color: gameStoreInstance
                                          .selectedGameMode.value.color
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
                                          .selectedGameMode.value.color
                                          .withOpacity(0.8),
                                    ),
                                    const Gap.w4(),
                                    LabelWidget(
                                      gameStoreInstance
                                              .secondPlayer.value?.name ??
                                          '',
                                      color: gameStoreInstance
                                          .selectedGameMode.value.color
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
                                    Column(
                                      children: gameStoreInstance
                                          .selectedGame.value!.getDragObjects
                                          .map(
                                        (e) {
                                          final selectedItems = controller
                                              .objects.value
                                              .where((element) =>
                                                  element.ownBy == 1 &&
                                                  element.item.name ==
                                                      e.item.name)
                                              .map((e1) => e1.score)
                                              .toList();
                                          int score = 0;
                                          if (selectedItems.isNotEmpty) {
                                            score = selectedItems.reduce(
                                                (value, element) =>
                                                    value + element);
                                          }
                                          return BulletRewardCard(
                                            item: e.item,
                                            score: score,
                                            color: gameStoreInstance
                                                .selectedGameMode.value.color
                                                .withOpacity(0.6),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                    VerticalDivider(
                                      color: gameStoreInstance
                                          .selectedGameMode.value.color
                                          .withOpacity(0.6),
                                    ),
                                    Column(
                                      children: gameStoreInstance
                                          .selectedGame.value!.getDragObjects
                                          .map(
                                        (e) {
                                          final selectedItems = controller
                                              .objects.value
                                              .where((element) =>
                                                  element.ownBy == 2 &&
                                                  element.item.name ==
                                                      e.item.name)
                                              .map((e1) => e1.score)
                                              .toList();
                                          int score = 0;
                                          if (selectedItems.isNotEmpty) {
                                            score = selectedItems.reduce(
                                                (value, element) =>
                                                    value + element);
                                          }
                                          return BulletRewardCard(
                                            item: e.item,
                                            score: score,
                                            color: gameStoreInstance
                                                .selectedGameMode.value.color
                                                .withOpacity(0.6),
                                          );
                                        },
                                      ).toList(),
                                    ),
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
