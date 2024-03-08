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
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BlendMode? blendMode;
  String name = '';
  int index = 0;

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
          (e) => PaperCard(
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            backgroundColor: ColorName.copperGold.withOpacity(0.1),
            borderColor: Colors.brown,
            borderRadius: 8,
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
                color: ColorName.copperGold,
                fontWeight: FontWeight.bold,
                borderThickness: 2,
                width: 150,
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
                width: 150,
                color: ColorName.copperGold,
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
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: PaperCard(
          height: double.infinity,
          child: Watch(
            (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    buildPlayerSelectionView(),
                    const Gap.h32(),
                    ImageWidget(
                      imageLocation: Assets.images.logo.path,
                    ),
                    const Gap.h32(),
                    buildLevelView(),
                    const Gap.h32(),
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
