import 'package:flutter/material.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/models/drag_object.dart';

class DragObjectView extends StatefulWidget {
  const DragObjectView({
    super.key,
    required this.dragObject,
    required this.size,
    this.onItemReceived,
  });

  final DragObject dragObject;
  final Size size;
  final Function(int playerId)? onItemReceived;

  @override
  State<DragObjectView> createState() => _DragObjectViewState();
}

class _DragObjectViewState extends State<DragObjectView> {
  final _draggableKey = GlobalKey();

  DragObject get dragObject => widget.dragObject;
  Size get size => widget.size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: dragObject.rootPosition.dx,
      top: dragObject.rootPosition.dy,
      child: Visibility(
        visible:
            dragObject.visibleTime < DateTime.now().millisecondsSinceEpoch &&
                dragObject.ownBy == 0,
        child: Draggable(
          key: _draggableKey,
          hitTestBehavior: HitTestBehavior.translucent,
          feedback: Container(),
          ignoringFeedbackPointer: false,
          maxSimultaneousDrags: 2,
          dragAnchorStrategy: childDragAnchorStrategy,
          data: DateTime.now().millisecondsSinceEpoch,
          onDragUpdate: (dragDetails) {
            double x = dragDetails.localPosition.dx - dragObject.tapOffset.dx;
            double y = dragDetails.localPosition.dy - dragObject.tapOffset.dy;

            if (y < 0) {
              y = 0;
            }

            if (y + dragObject.size.height > size.height) {
              y = size.height - dragObject.size.height;
            }
            dragObject.targetPosition = Offset(x, y);
            if (dragObject.checkIsFirstPlayerWinner(size)) {
              widget.onItemReceived?.call(1);
            }

            if (dragObject.checkIsSecondPlayerWinner(size)) {
              widget.onItemReceived?.call(2);
            }
          },
          onDragEnd: (details) {
            setState(() {
              dragObject.targetPosition = Offset(
                dragObject.rootPosition.dx,
                dragObject.rootPosition.dy,
              );

              if (dragObject.checkIsFirstPlayerWinner(size)) {
                widget.onItemReceived?.call(1);
              }

              if (dragObject.checkIsSecondPlayerWinner(size)) {
                widget.onItemReceived?.call(2);
              }
            });
          },
          child: GestureDetector(
            onTapDown: (details) {
              dragObject.tapOffset = details.localPosition;
            },
            child: Container(
              height: dragObject.size.height,
              width: dragObject.size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                color: HexColor.fromHex(dragObject.item.color),
              ),
              child: Center(
                child: LabelWidget(
                  dragObject.item.name,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
