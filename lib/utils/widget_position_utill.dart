import 'package:flutter/material.dart';

Offset getPosition(GlobalKey key) {
  RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
  return box.localToGlobal(Offset.zero);
}

Size getSize(GlobalKey key) {
  RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
  return box.size;
}
