import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/secondary_button.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/routes/app_router.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

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

  Widget buildMenus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SecondaryButton(
        title: 'PLAY',
        onPressed: () {
          context.router.push(const GameRoute());
        },
        color: Colors.white,
        width: double.infinity,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        borderThickness: 3,
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
                buildMenus(),
                const Expanded(child: SizedBox.shrink()),
              ],
            );
          },
        ),
      ),
    );
  }
}
