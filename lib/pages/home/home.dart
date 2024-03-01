import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/secondary_button.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/data/levels_data.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
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
  @override
  void initState() {
    gameStoreInstance.loadAllPlayers();
    super.initState();
  }

  Widget buildLevelView() {
    gameStoreInstance.selectedGame.value ??= levelData[0];

    return Column(
      children: [
        ...levelData.map(
          (e) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: HexColor.fromHex(e.color).withOpacity(0.7),
                width: 4,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            color: ColorName.background,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  gameStoreInstance.selectedGame.value = e;
                  context.router.push(const OptionsRoute());
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ImageWidget(
                      imageLocation: e.image,
                      height: 100,
                    ),
                    const Gap.h16(),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: LabelWidget(
                          e.title.toString(),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor.fromHex(e.color),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
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
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                borderThickness: 2,
                width: 150,
              ),
              const LabelWidget(
                'Player 1',
                fontSize: 12,
                color: Colors.grey,
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
                width: 150,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                borderThickness: 2,
              ),
              const LabelWidget(
                'Player 2',
                fontSize: 12,
                color: Colors.grey,
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
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Watch(
          (context) {
            return Column(
              children: [
                buildPlayerSelectionView(),
                const Gap.h32(),
                ImageWidget(
                  imageLocation: Assets.images.logo.path,
                ),
                const Gap.h32(),
                Expanded(
                  child: buildLevelView(),
                ),
                const Gap.h32(),
              ],
            );
          },
        ),
      ),
    );
  }
}
