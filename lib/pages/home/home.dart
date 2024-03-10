import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/data/levels_data.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
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
                  context.router.push(OptionsRoute(levelDataModel: e));
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                height: 50,
                width: double.infinity,
                child: Center(
                  child: LabelWidget(
                    e.title,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
