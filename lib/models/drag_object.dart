import 'dart:ui';

import 'package:flutter_game/constants/constants.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drag_object.g.dart';

Map offsetToJson(Offset offset) {
  return {
    'dx': offset.dx,
    'dy': offset.dy,
  };
}

Offset jsonToOffset(Map json) {
  return Offset(
    json['dx'] as double? ?? 0,
    json['dy'] as double? ?? 0,
  );
}

Map sizeToJson(Size size) {
  return {
    'width': size.width,
    'height': size.height,
  };
}

Size josnToSize(Map json) {
  return Size(
    json['width'] as double? ?? 0,
    json['height'] as double? ?? 0,
  );
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class DragObject {
  int id;
  ItemModel item;

  @JsonKey(toJson: offsetToJson, fromJson: jsonToOffset)
  Offset targetPosition;
  @JsonKey(toJson: offsetToJson, fromJson: jsonToOffset)
  Offset rootPosition;
  @JsonKey(toJson: offsetToJson, fromJson: jsonToOffset)
  Offset tapOffset;
  @JsonKey(toJson: sizeToJson, fromJson: josnToSize)
  Size size;
  int visibleTime;
  int ownBy;

  int get score {
    if (item.keyType == ItemType.positive) {
      return 1;
    }
    if (item.keyType == ItemType.negative) {
      return -1;
    }
    return 0;
  }

  DragObject({
    required this.id,
    required this.size,
    required this.item,
    this.visibleTime = 0,
    this.rootPosition = const Offset(0, 0),
    this.targetPosition = const Offset(0, 0),
    this.tapOffset = const Offset(0, 0),
    this.ownBy = 0,
  });

  bool updateActualPosition() {
    bool refresh = false;
    if (rootPosition.dx < targetPosition.dx) {
      refresh = true;
      double x = rootPosition.dx + deltaUpdatePX;
      if (targetPosition.dx - rootPosition.dx < deltaUpdatePX) {
        x = targetPosition.dx;
      }
      rootPosition = Offset(x, rootPosition.dy);
    } else if (rootPosition.dx > targetPosition.dx) {
      refresh = true;
      double x = rootPosition.dx - deltaUpdatePX;
      if (rootPosition.dx - targetPosition.dx < deltaUpdatePX) {
        x = targetPosition.dx;
      }
      rootPosition = Offset(x, rootPosition.dy);
    }
    if (rootPosition.dy < targetPosition.dy) {
      refresh = true;
      double y = rootPosition.dy + deltaUpdatePX;
      if (targetPosition.dy - rootPosition.dy < deltaUpdatePX) {
        y = targetPosition.dy;
      }
      rootPosition = Offset(rootPosition.dx, y);
    } else if (rootPosition.dy > targetPosition.dy) {
      refresh = true;
      double y = rootPosition.dy - deltaUpdatePX;
      if (rootPosition.dy - targetPosition.dy < deltaUpdatePX) {
        y = targetPosition.dy;
      }
      rootPosition = Offset(rootPosition.dx, y);
    }
    return refresh;
  }

  bool checkIsWinner(Size boundary) {
    return (rootPosition.dy < targetPlayerHeight ||
        rootPosition.dy + size.height > (boundary.height - targetPlayerHeight));
  }

  bool checkIsFirstPlayerWinner(Size boundary) {
    return (rootPosition.dy < targetPlayerHeight);
  }

  bool checkIsSecondPlayerWinner(Size boundary) {
    return (rootPosition.dy + size.height >
        (boundary.height - targetPlayerHeight));
  }

  factory DragObject.fromJson(Map<String, dynamic> json) =>
      _$DragObjectFromJson(json);

  Map<String, dynamic> toJson() => _$DragObjectToJson(this);
}
