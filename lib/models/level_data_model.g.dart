// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelDataModel _$LevelDataModelFromJson(Map json) => LevelDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      concept: json['concept'] as String,
      levelNumber: json['levelNumber'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      color: colorFromJson(json['color']),
      isImage: json['isImage'] as bool? ?? false,
    );

Map<String, dynamic> _$LevelDataModelToJson(LevelDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'levelNumber': instance.levelNumber,
      'title': instance.title,
      'image': instance.image,
      'concept': instance.concept,
      'isImage': instance.isImage,
      'color': colorToJson(instance.color),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

ItemModel _$ItemModelFromJson(Map json) => ItemModel(
      name: json['name'] as String,
      keyType: $enumDecode(_$ItemTypeEnumMap, json['keyType']),
      image: json['image'] as String? ?? '',
      color: json['color'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'color': instance.color,
      'keyType': _$ItemTypeEnumMap[instance.keyType]!,
    };

const _$ItemTypeEnumMap = {
  ItemType.positive: 'positive',
  ItemType.negative: 'negative',
};
