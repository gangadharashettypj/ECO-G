import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/flat_button_widget.dart';
import 'package:flutter_game/components/custom_text_field/custom_text_field.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/player_model.dart';
import 'package:flutter_game/pages/dashboard/store/game_store.dart';

class NewPlayerDialog extends StatefulWidget {
  const NewPlayerDialog({
    super.key,
    required this.onPlayerSelected,
  });

  final Function(PlayerModel)? onPlayerSelected;

  @override
  State<NewPlayerDialog> createState() => _NewPlayerDialogState();
}

class _NewPlayerDialogState extends State<NewPlayerDialog> {
  String playerName = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const LabelWidget(
        'Add New Player',
        fontWeight: FontWeight.bold,
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hintText: 'Player Name',
              onChanged: (val) {
                playerName = val;
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
        ),
        FlatButtonWidget(
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (playerName.isEmpty) {
              BotToast.showText(text: 'Please enter a valid player name');
              return;
            }

            if (gameStoreInstance.players.value
                .where((element) =>
                    element.name.toLowerCase() == playerName.toLowerCase())
                .isNotEmpty) {
              BotToast.showText(
                  text: 'Player with name $playerName already exist');
              return;
            }

            final player = await gameStoreInstance.addPlayer(playerName);
            BotToast.showText(text: 'Player added successfully');
            widget.onPlayerSelected?.call(player);
            Navigator.pop(context);
          },
          title: 'Save',
          color: ColorName.primaryDark,
        ),
      ],
    );
  }
}
