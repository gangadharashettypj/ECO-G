import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/button_widget.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class OptionsScreen extends StatefulWidget {
  const OptionsScreen({
    super.key,
    required this.levelDataModel,
  });

  final LevelDataModel levelDataModel;

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  Widget buildModeCard(GameMode e) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          gameStoreInstance.selectedGameMode.value = e;
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: gameStoreInstance.selectedGameMode.value == e ? 3 : 0,
            ),
            borderRadius: BorderRadius.circular(8),
            color: gameStoreInstance.selectedGameMode.value == e
                ? Colors.black38
                : Colors.white10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ImageWidget(
            imageLocation: e.image,
            width: 82,
            height: 82,
            color: gameStoreInstance.selectedGame.value!.color,
          ),
        ),
      ),
    );
  }

  Widget buildSelectedCard() {
    return Center(
      child: PaperCard(
        borderRadius: 32,
        backgroundColor: const Color(0xFFFAF1C6),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: ImageWidget(
                    imageLocation:
                        gameStoreInstance.selectedGameMode.value.image,
                    height: 150,
                    width: 150,
                    color: gameStoreInstance.selectedGame.value!.color,
                  ),
                ),
                LabelWidget(
                  gameStoreInstance.selectedGameMode.value.title.toUpperCase(),
                  color: ColorName.textLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      backgroundColor: widget.levelDataModel.color.withOpacity(0.2),
      borderColor: widget.levelDataModel.color,
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: LabelWidget(
            'BACK',
            color: widget.levelDataModel.color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: widget.levelDataModel.color,
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Watch(
            (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap.h32(),
                  Expanded(
                    child: buildSelectedCard(),
                  ),
                  const Gap.h32(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...GameMode.values.map(
                        (e) => buildModeCard(e),
                      )
                    ],
                  ),
                  Center(
                    child: ButtonWidget(
                      title: 'PLAY',
                      onPressed: () {
                        if (gameStoreInstance.firstPlayer.value == null ||
                            gameStoreInstance.secondPlayer.value == null) {
                          BotToast.showText(
                              text: 'Please select players first');
                          return;
                        }
                        context.router.push(
                          gameStoreInstance.selectedGameMode.value.route,
                        );
                      },
                      backgroundColor: Colors.white,
                      expanded: false,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
