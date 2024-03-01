import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/secondary_button.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/data/levels_data.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/pages/home/widgets/PlayerSelectedDialog.dart';
import 'package:flutter_game/routes/app_router.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LevelDataModel? selectedGame;

  @override
  void initState() {
    gameStoreInstance.loadAllPlayers();
    super.initState();
  }

  Widget buildMenus() {
    return SecondaryButton(
      title: 'PLAY',
      onPressed: () {
        selectedGame;
        context.router.push(GameRoute(selectedGame: selectedGame!));
      },
      color: Colors.black,
      fontWeight: FontWeight.bold,
      borderThickness: 3,
    );
  }

  Widget buildLevelView() {
    selectedGame ??= levelData[0];
    return Column(
      children: [
        Wrap(
          children: levelData
              .map(
                (e) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: ColorName.textLightColor,
                      width: 2,
                    ),
                  ),
                  color: selectedGame?.id == e.id
                      ? Colors.grey.shade400
                      : Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        selectedGame = e;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: LabelWidget(
                        e.levelNumber.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget buildPlayerSelectionView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SecondaryButton(
                title: gameStoreInstance.firstPlayer.value?.name ?? 'Select',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PlayerSelectionDialog(
                        title: 'Select Player 1',
                        onPlayerSelected: (player) {
                          gameStoreInstance.firstPlayer.value = player;
                        },
                        oppositePlayer: gameStoreInstance.secondPlayer.value,
                      );
                    },
                  );
                },
                color: ColorName.textDarkColor,
                fontWeight: FontWeight.bold,
                borderThickness: 2,
              ),
              const LabelWidget(
                'Player 1',
                fontSize: 12,
              ),
            ],
          ),
          Column(
            children: [
              SecondaryButton(
                title: gameStoreInstance.secondPlayer.value?.name ?? 'Select',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PlayerSelectionDialog(
                        title: 'Select Player 2',
                        onPlayerSelected: (player) {
                          gameStoreInstance.secondPlayer.value = player;
                        },
                        oppositePlayer: gameStoreInstance.firstPlayer.value,
                      );
                    },
                  );
                },
                color: ColorName.textDarkColor,
                fontWeight: FontWeight.bold,
                borderThickness: 2,
              ),
              const LabelWidget(
                'Player 2',
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Watch(
          (context) {
            return Column(
              children: [
                buildPlayerSelectionView(),
                const Gap.h32(),
                Expanded(
                  child: buildLevelView(),
                ),
                const Gap.h32(),
                buildMenus(),
                const Gap.h32(),
              ],
            );
          },
        ),
      ),
    );
  }
}
