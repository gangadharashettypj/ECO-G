import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/flat_button_widget.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/player_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';
import 'package:flutter_game/pages/home/widgets/NewPlayerDialog.dart';

class PlayerSelectionDialog extends StatefulWidget {
  const PlayerSelectionDialog({
    super.key,
    required this.title,
    this.oppositePlayer,
    this.onPlayerSelected,
  });

  final String title;
  final PlayerModel? oppositePlayer;

  final Function(PlayerModel)? onPlayerSelected;

  @override
  State<PlayerSelectionDialog> createState() => _PlayerSelectionDialogState();
}

class _PlayerSelectionDialogState extends State<PlayerSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Row(
          children: [
            Expanded(
              child: LabelWidget(
                widget.title,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
                gameStoreInstance.players.value
                    .where((element) => element.id != widget.oppositePlayer?.id)
                    .length,
                (index) => index).map(
              (index) {
                final e = gameStoreInstance.players.value
                    .where((element) => element.id != widget.oppositePlayer?.id)
                    .toList()[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorName.textDarkColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    title: LabelWidget(
                      '${index + 1}. ${e.name}',
                      color: ColorName.textDarkColor,
                      fontWeight: FontWeight.w600,
                    ),
                    selected: true,
                    onTap: () {
                      widget.onPlayerSelected?.call(e);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        FlatButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
          title: 'Cancel',
          color: Colors.grey,
          padding: EdgeInsets.zero,
        ),
        FlatButtonWidget(
          onPressed: () async {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NewPlayerDialog(
                  onPlayerSelected: widget.onPlayerSelected,
                );
              },
              barrierDismissible: false,
            );
          },
          title: 'Add',
          color: ColorName.primaryDark,
        ),
      ],
    );
  }
}
