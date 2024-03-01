import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class PlayerModel {
  final String id;
  final String name;

  PlayerModel({
    required this.id,
    required this.name,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}
