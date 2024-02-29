import 'package:flutter_game/db/db.dart';
import 'package:flutter_game/di/di.dart';
import 'package:flutter_game/models/player_model.dart';
import 'package:flutter_game/pages/dashboard/controller/game_controller.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

GameStore get gameStoreInstance => getIt<GameStore>();

@lazySingleton
class GameStore {
  final controller = getIt<GameController>();

  final players = signal<List<PlayerModel>>([]);

  final firstPlayer = signal<PlayerModel?>(null);
  final secondPlayer = signal<PlayerModel?>(null);

  void loadAllPlayers() {
    dynamic data = dbInstance.get(DBKeys.players);
    data ??= [];
    final cachedPlayers = (data as List)
        .map(
          (e) => PlayerModel.fromJson(
            Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
          ),
        )
        .toList();
    if (cachedPlayers.firstWhereOrNull((element) => element.id == 0) == null) {
      cachedPlayers.insert(
        0,
        PlayerModel(
          id: '0',
          name: 'You',
        ),
      );
    }
    players.value = cachedPlayers;
  }

  Future<PlayerModel> addPlayer(String playerName) async {
    final player = PlayerModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: playerName,
    );
    players.value.add(player);

    await dbInstance.store(
      DBKeys.players,
      players.value.map((e) => e.toJson()).toList(),
    );

    return player;
  }
}
