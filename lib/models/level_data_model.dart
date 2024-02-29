class LevelDataModel {
  final String id;
  final int levelNumber;
  final String title;
  final String concept;
  final bool isImage;
  final List<String> itemImages;
  final List<String> itemNames;

  LevelDataModel({
    required this.id,
    required this.title,
    required this.concept,
    required this.levelNumber,
    required this.itemImages,
    required this.itemNames,
    this.isImage = false,
  });
}

enum ObjectType {
  words,
  colors,
  images,
}

enum VariantType {
  blitz,
  bullet,
  rapid,
}

class GameTypeModel {
  final String id;
  final String title;
  final String concept;
  final ObjectType objectType;
  final VariantType variantType;

  GameTypeModel({
    required this.id,
    required this.title,
    required this.concept,
    required this.objectType,
    required this.variantType,
  });
}
