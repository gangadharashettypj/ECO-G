// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelDataModel _$LevelDataModelFromJson(Map json) => LevelDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      concept: json['concept'] as String,
      levelNumber: json['levelNumber'] as int,
      itemImages: (json['itemImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      itemNames:
          (json['itemNames'] as List<dynamic>).map((e) => e as String).toList(),
      color: json['color'] as String? ?? '#FFFFFF',
      isImage: json['isImage'] as bool? ?? false,
    );

Map<String, dynamic> _$LevelDataModelToJson(LevelDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'levelNumber': instance.levelNumber,
      'title': instance.title,
      'concept': instance.concept,
      'isImage': instance.isImage,
      'color': instance.color,
      'itemImages': instance.itemImages,
      'itemNames': instance.itemNames,
    };
