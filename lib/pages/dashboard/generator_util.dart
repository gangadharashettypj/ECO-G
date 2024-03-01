import 'dart:math';
import 'dart:ui';

import 'package:flutter_game/models/drag_object.dart';

List collectibles = [
  {
    'object': 'Alice',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Bob',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Emma',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Mathew',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Barney',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Conan',
    'dimensions': {'width': 10, 'height': 30}
  },
  {
    'object': 'Goku',
    'dimensions': {'width': 20, 'height': 40}
  },
];

double randomInRange({required double min, required double max}) {
  Random random = Random();
  return min + random.nextDouble() * (max - min);
}

Offset generateRandomCoordinates({
  required double screenWidth,
  required double screenHeight,
  required Size size,
}) {
  double randomX = randomInRange(min: 1, max: (screenWidth - size.width));
  double randomY =
      randomInRange(min: 130, max: (screenHeight - size.height - 130));

  return Offset(randomX, randomY);
}

int generateShowTime({
  required int showIteration,
  int timePattern = 2,
  int minimumGap = 3,
}) {
  int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

  int futureTime = (currentTimeMillis + showIteration * minimumGap * 1000);

  int randomTime =
      randomInRange(min: 0, max: timePattern.toDouble()).toInt() * 1000;

  return futureTime + randomTime;
}

void addRandomStartPositionForObjects({
  required double screenWidth,
  required double screenHeight,
  required List<DragObject> collectibles,
}) {
  for (int i = 0; i < collectibles.length; i++) {
    final element = collectibles[i];
    element.rootPosition = generateRandomCoordinates(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      size: element.size,
    );
    element.visibleTime = generateShowTime(showIteration: i);
    element.targetPosition = Offset(
      element.rootPosition.dx,
      element.rootPosition.dy,
    );
  }
}
