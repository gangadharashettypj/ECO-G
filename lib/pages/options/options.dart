import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/routes/app_router.dart';
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: ColorName.copperGold.withOpacity(0.9),
          width: 4,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      color: gameStoreInstance.selectedGameMode.value == e
          ? Colors.black45
          : ColorName.background,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          gameStoreInstance.selectedGameMode.value = e;
          context.router.push(const GameRoute());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_right,
                color: ColorName.copperGold,
                size: 60,
              ),
              const Gap.w16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LabelWidget(
                      e.title,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: ColorName.copperGold,
                    ),
                    LabelWidget(
                      e.subTitle,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
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
      backgroundColor:
          HexColor.fromHex(widget.levelDataModel.color).withOpacity(0.2),
      borderColor: HexColor.fromHex(widget.levelDataModel.color),
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const LabelWidget(
            'BACK',
            color: ColorName.copperGold,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: ColorName.copperGold,
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Watch(
            (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  ImageWidget(
                    imageLocation: Assets.images.logo.path,
                    height: 100,
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  ...GameMode.values.map(
                    (e) => buildModeCard(e),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
