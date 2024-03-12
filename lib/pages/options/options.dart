import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
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
            width: 46,
            height: 46,
            color: gameStoreInstance.selectedGame.value!.color,
          ),
        ),
      ),
    );
  }

  Widget buildSelectedCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaperCard(
          borderRadius: 8,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFFAF1C6),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorName.copperGold.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ImageWidget(
                      imageLocation:
                          gameStoreInstance.selectedGameMode.value.image,
                      height: 70,
                      width: 70,
                      color: ColorName.textDarkColor,
                    ),
                  ),
                  LabelWidget(
                    gameStoreInstance.selectedGameMode.value.title
                        .toUpperCase(),
                    color: ColorName.textLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Markdown(
                      data: gameStoreInstance.selectedGameMode.value ==
                              GameMode.bullet
                          ? '''
### Instruction:
  * Features two types of items: 
	  * Positive Items 
	  * Negative Items.
  * Each positive item adds +2 points.
  * Aim to collect positive items;

'''
                          : '''
### Instruction:
  * Includes two types of items: 
    * Positive Items 
    * Negative Items.
  * Positive Items contribute +2 points each.
  * Negative Items deduct -1 point each.
  * Aim to collect positive items.
                    ''',
                    ),
                  ),
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
    return PaperCard(
      backgroundColor: widget.levelDataModel.color.withOpacity(0.2),
      borderColor: widget.levelDataModel.color,
      borderRadius: 8,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
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
        body: Watch((context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildSelectedCard(),
              ),
              const Gap.h16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...GameMode.values.map(
                    (e) => buildModeCard(e),
                  )
                ],
              ),
              const Gap.h32(),
              Center(
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      gameStoreInstance.selectedGameMode.value.route,
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: PaperCard(
                    borderRadius: 8,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    borderColor: gameStoreInstance.selectedGame.value!.color,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'PLAY',
                        style: GoogleFonts.rubikDoodleShadow().copyWith(
                          color: gameStoreInstance.selectedGame.value!.color,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap.h16(),
            ],
          );
        }),
      ),
    );
  }
}
