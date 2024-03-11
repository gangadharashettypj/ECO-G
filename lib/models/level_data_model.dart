import 'dart:ui';

import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level_data_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class LevelDataModel {
  final String id;
  final int levelNumber;
  final String title;
  final String image;
  final String concept;
  final bool isImage;
  final String color;
  final List<ItemModel> items;

  Color get formattedColor => HexColor.fromHex(color);

  LevelDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.concept,
    required this.levelNumber,
    required this.items,
    this.color = '#FFFFFF',
    this.isImage = false,
  });

  List<DragObject> get getDragObjects =>
      List.generate(items.length, (index) => index)
          .map(
            (e) => DragObject(
              id: e,
              size: const Size(
                150,
                100,
              ),
              item: items[e],
            ),
          )
          .toList();

  factory LevelDataModel.fromJson(Map<String, dynamic> json) =>
      _$LevelDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelDataModelToJson(this);
}

enum ItemType {
  positive,
  negative,
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class ItemModel {
  final String name;
  final String image;
  final String color;
  final ItemType keyType;

  ItemModel({
    required this.name,
    required this.keyType,
    this.image = '',
    this.color = '#FFFFFF',
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
