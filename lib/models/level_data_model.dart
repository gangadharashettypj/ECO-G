import 'dart:ui';

import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/models/drag_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level_data_model.g.dart';

Color colorFromJson(json) {
  return HexColor.fromHex(json['color']);
}

String colorToJson(Color color) {
  return color.toHex();
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class LevelDataModel {
  final String id;
  final int levelNumber;
  final String title;
  final String image;
  final List<String> concept;
  final bool isImage;
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color color;
  final List<ItemModel> items;

  LevelDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.concept,
    required this.levelNumber,
    required this.items,
    required this.color,
    this.isImage = false,
  });

  List<DragObject> get getDragObjects =>
      List.generate(items.length, (index) => index)
          .map(
            (e) => DragObject(
              id: e,
              size: const Size(
                120,
                80,
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

enum ViewType {
  currency,
  coin,
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class ItemModel {
  final String name;
  final String image;
  final String color;
  final ItemType keyType;
  ViewType viewType;

  ItemModel({
    required this.name,
    required this.keyType,
    this.viewType = ViewType.currency,
    this.image = '',
    this.color = '#FFFFFF',
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
