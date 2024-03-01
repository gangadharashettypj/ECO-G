import 'package:json_annotation/json_annotation.dart';

part 'level_data_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class LevelDataModel {
  final String id;
  final int levelNumber;
  final String title;
  final String concept;
  final bool isImage;
  final String color;
  final List<String> itemImages;
  final List<String> itemNames;

  LevelDataModel({
    required this.id,
    required this.title,
    required this.concept,
    required this.levelNumber,
    required this.itemImages,
    required this.itemNames,
    this.color = '#FFFFFF',
    this.isImage = false,
  });

  factory LevelDataModel.fromJson(Map<String, dynamic> json) =>
      _$LevelDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelDataModelToJson(this);
}
