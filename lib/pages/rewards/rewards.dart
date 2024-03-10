import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/enums/modes.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game_controller.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:paper_card/paper_card.dart';
import 'package:signals/signals_flutter.dart';

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
  @override
  Widget build(BuildContext context) {
    return PaperCard(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      backgroundColor:
          gameStoreInstance.selectedGameMode.value.color.withOpacity(0.2),
      borderColor: gameStoreInstance.selectedGameMode.value.color,
      borderRadius: 8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: gameStoreInstance.selectedGameMode.value.color,
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Watch(
            (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              );
            },
          ),
        ),
      ),
    );
  }
}
