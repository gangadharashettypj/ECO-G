import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/secondary_button.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/data/levels_data.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/pages/home/widgets/PlayerSelectedDialog.dart';
import 'package:flutter_game/routes/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gameStoreInstance.firstPlayer.value =
          gameStoreInstance.players.value.first;
      gameStoreInstance.secondPlayer.value = gameStoreInstance.players.value[1];
    });

    super.initState();
  }

  Widget buildGreenDoctor() {
    return InkWell(
      onTap: () {
        gameStoreInstance.selectedGame.value = greenDoctorLevel;
        context.router.push(OptionsRoute(levelDataModel: greenDoctorLevel));
      },
      child: PaperCard(
        borderRadius: 8,
        backgroundColor: const Color(0xFF2F1E0D),
        borderColor: ColorName.copperGold,
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Transform.scale(
                  scaleX: 1.4,
                  scaleY: 1.4,
                  child: Opacity(
                    opacity: 0.9,
                    child: ImageWidget(
                      imageLocation: Assets.images.treeBg.path,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 20,
                child: Text(
                  'Green\nDoctor',
                  style: GoogleFonts.rubikDoodleShadow().copyWith(
                    color: ColorName.copperGold,
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWater() {
    return InkWell(
      onTap: () {
        gameStoreInstance.selectedGame.value = waterLevel;
        context.router.push(OptionsRoute(levelDataModel: waterLevel));
      },
      child: PaperCard(
        borderRadius: 8,
        backgroundColor: const Color(0xFF102D40),
        borderColor: const Color(0xFF02B1DA),
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.9,
                  child: ImageWidget(
                    imageLocation: Assets.images.waterBg.path,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 20,
                child: Text(
                  'Thirsty',
                  style: GoogleFonts.rubikDoodleShadow().copyWith(
                    color: const Color(0xFF02B1DA),
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecyclable() {
    return InkWell(
      onTap: () {
        gameStoreInstance.selectedGame.value = recyclableLevel;
        context.router.push(OptionsRoute(levelDataModel: recyclableLevel));
      },
      child: PaperCard(
        borderRadius: 8,
        backgroundColor: Colors.lime.withOpacity(0.1),
        borderColor: Colors.lime,
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.8,
                  child: ImageWidget(
                    imageLocation: Assets.images.recycleBg.path,
                    color: Colors.lime,
                    width: 110,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 20,
                child: Text(
                  'Recyclable',
                  style: GoogleFonts.rubikDoodleShadow().copyWith(
                    color: Colors.lime,
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRenewable() {
    return InkWell(
      onTap: () {
        gameStoreInstance.selectedGame.value = renewableLevel;
        context.router.push(OptionsRoute(levelDataModel: renewableLevel));
      },
      child: PaperCard(
        borderRadius: 8,
        backgroundColor: const Color(0xFF8C5400),
        borderColor: ColorName.copperGold,
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: ImageWidget(
                  imageLocation: Assets.images.solarPanel.path,
                  width: 200,
                  color: const Color(0xDFFAF2CE),
                ),
              ),
              Positioned(
                right: -10,
                top: -10,
                child: ImageWidget(
                  imageLocation: Assets.images.sun.path,
                  width: 100,
                  color: const Color(0xDFFAF2CE),
                ),
              ),
              Positioned(
                left: 0,
                bottom: -10,
                child: ImageWidget(
                  imageLocation: Assets.images.fan.path,
                  width: 60,
                  color: const Color(0x4FFAF2CE),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 20,
                child: Text(
                  'Renewable\nEnergy',
                  style: GoogleFonts.rubikDoodleShadow().copyWith(
                    color: const Color(0xFFFAF2CE),
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLevelView() {
    return Column(
      children: [
        buildRenewable(),
        const Gap.h32(),
        buildWater(),
        const Gap.h32(),
        buildGreenDoctor(),
        const Gap.h32(),
        buildRecyclable(),
        const Gap.h32(),
      ],
    );
  }

  Widget buildPlayerSelectionView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
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
                  width: double.infinity,
                ),
                const Gap.h8(),
                LabelWidget(
                  'Player 1',
                  fontSize: 12,
                  color: ColorName.copperGold.withOpacity(0.7),
                ),
              ],
            ),
          ),
          const Gap.w32(),
          Expanded(
            child: Column(
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
                  width: double.infinity,
                  color: ColorName.copperGold,
                  fontWeight: FontWeight.bold,
                  borderThickness: 2,
                ),
                const Gap.h8(),
                LabelWidget(
                  'Player 2',
                  fontSize: 12,
                  color: ColorName.copperGold.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PaperCard(
          height: double.infinity,
          backgroundColor: ColorName.background,
          child: Watch(
            (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ECO -',
                          style: GoogleFonts.rubikGlitchPop().copyWith(
                            color: ColorName.copperGold,
                            fontSize: 50,
                          ),
                        ),
                        const Gap.w8(),
                        Text(
                          'G',
                          style: GoogleFonts.rubikGlitch().copyWith(
                            color: Colors.green,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),

                    buildPlayerSelectionView(),
                    const Gap.h16(),
                    // const Gap.h32(),
                    // ImageWidget(
                    //   imageLocation: Assets.images.logo.path,
                    //   height: 100,
                    // ),
                    // const Gap.h32(),
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
