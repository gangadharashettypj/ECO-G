// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drag_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragObject _$DragObjectFromJson(Map json) => DragObject(
      id: json['id'] as int,
      size: josnToSize(json['size'] as Map),
      item: ItemModel.fromJson(Map<String, dynamic>.from(json['item'] as Map)),
      visibleTime: json['visibleTime'] as int? ?? 0,
      rootPosition: json['rootPosition'] == null
          ? const Offset(0, 0)
          : jsonToOffset(json['rootPosition'] as Map),
      targetPosition: json['targetPosition'] == null
          ? const Offset(0, 0)
          : jsonToOffset(json['targetPosition'] as Map),
      tapOffset: json['tapOffset'] == null
          ? const Offset(0, 0)
          : jsonToOffset(json['tapOffset'] as Map),
      ownBy: json['ownBy'] as int? ?? 0,
    );

Map<String, dynamic> _$DragObjectToJson(DragObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item.toJson(),
      'targetPosition': offsetToJson(instance.targetPosition),
      'rootPosition': offsetToJson(instance.rootPosition),
      'tapOffset': offsetToJson(instance.tapOffset),
      'size': sizeToJson(instance.size),
      'visibleTime': instance.visibleTime,
      'ownBy': instance.ownBy,
    };
