import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game_controller.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';

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

  Widget buildScoreView() {
    final (rights1, wrongs1) = widget.controller.getPointsStats(1);
    final (rights2, wrongs2) = widget.controller.getPointsStats(2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: PaperCard(
            borderRadius: 8,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap.h8(),
                  const Center(
                    child: LabelWidget(
                      "You're an eco-warrior :)",
                      fontWeight: FontWeight.w500,
                      color: ColorName.textDarkColor,
                      fontSize: 16,
                    ),
                  ),
                  const Gap.h16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        color: ColorName.textDarkColor,
                      ),
                      const Gap.w4(),
                      Expanded(
                        child: LabelWidget(
                          gameStoreInstance.firstPlayer.value?.name ?? '',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: widget.controller.getPlayer1Color,
                        ),
                      ),
                      if (gameStoreInstance.selectedGameMode.value ==
                          GameMode.blitz) ...[
                        Row(
                          children: [
                            LabelWidget(
                              '$rights1',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const Gap.w16(),
                        Row(
                          children: [
                            LabelWidget(
                              '$wrongs1',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const LabelWidget(
                          ' = ',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ],
                      LabelWidget(
                        widget.controller.player1Points.value.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const Gap.h12(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        color: ColorName.textDarkColor,
                      ),
                      const Gap.w4(),
                      Expanded(
                        child: LabelWidget(
                          gameStoreInstance.secondPlayer.value?.name ?? '',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: widget.controller.getPlayer2Color,
                        ),
                      ),
                      if (gameStoreInstance.selectedGameMode.value ==
                          GameMode.blitz) ...[
                        Row(
                          children: [
                            LabelWidget(
                              '$rights2',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const Gap.w16(),
                        Row(
                          children: [
                            LabelWidget(
                              '$wrongs2',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const LabelWidget(
                          ' = ',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ],
                      LabelWidget(
                        widget.controller.player2Points.value.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const Gap.h16(),
                  LabelWidget(
                    '"${(gameStoreInstance.selectedGame.value!.concept..shuffle())[0]}"',
                    maxLine: 5,
                    color: ColorName.textDarkColor,
                    fontSize: 13,
                    textAlign: TextAlign.justify,
                  ),
                  const Gap.h16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          context.popRoute();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: PaperCard(
                          borderRadius: 8,
                          borderColor: ColorName.copperGold,
                          padding: EdgeInsets.zero,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.home_outlined,
                                  color: ColorName.copperGold,
                                  size: 24,
                                ),
                                const Gap.w8(),
                                Text(
                                  'Home',
                                  style:
                                      GoogleFonts.rubikDoodleShadow().copyWith(
                                    color: ColorName.copperGold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap.h16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                          await context.router.pop();
                          context.router.push(
                              gameStoreInstance.selectedGameMode.value.route);
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: PaperCard(
                          borderRadius: 8,
                          borderColor: ColorName.copperGold,
                          padding: EdgeInsets.zero,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.replay,
                                  color: ColorName.copperGold,
                                  size: 20,
                                ),
                                const Gap.w8(),
                                Text(
                                  'Play Again',
                                  style:
                                      GoogleFonts.rubikDoodleShadow().copyWith(
                                    color: ColorName.copperGold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap.h16(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: buildScoreView(),
            ),
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    imageLocation: Assets.images.congrats.path,
                    height: 40,
                  ),
                  Opacity(
                    opacity: 0,
                    child: buildScoreView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
