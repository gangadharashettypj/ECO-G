import 'package:flutter/material.dart';
import 'package:flutter_game/data/eco_life.dart';
import 'package:flutter_game/data/recycle.dart';
import 'package:flutter_game/data/tree_items.dart';
import 'package:flutter_game/data/water_items.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/models/level_data_model.dart';

final greenDoctorLevel = LevelDataModel(
  id: 'LEVEL_1',
  image: Assets.images.treeBg.path,
  title: 'Green Doctor',
  concept: [
    'Planting trees helps combat climate change by absorbing carbon dioxide from the atmosphere and releasing oxygen, thus improving air quality.',
    'Trees play a crucial role in preserving biodiversity by providing habitats and food sources for various species.',
    'Urban tree planting enhances the aesthetics of cities, reduces noise pollution, and provides shade, contributing to a more livable environment.',
    'Protecting forests safeguards watersheds, prevents soil erosion, and maintains hydrological cycles, ensuring a sustainable supply of clean water.',
  ],
  levelNumber: 1,
  color: Colors.green,
  items: treeLevelItems,
);

final waterLevel = LevelDataModel(
  id: 'LEVEL_3',
  image: Assets.images.waterBg.path,
  title: 'Thirsty',
  concept: [
    'By conserving water usage, you\'ve contributed to preserving precious freshwater resources for future generations.',
    'Supporting initiatives to reduce water pollution aids in safeguarding aquatic life and ecosystems.',
    'Choosing eco-friendly products reduces the amount of water required for their production and minimizes water waste.',
    'Implementing water-efficient technologies helps in mitigating water scarcity issues and maintaining balanced hydrological cycles.',
  ],
  levelNumber: 3,
  color: ColorName.primaryDark,
  items: waterLevelItems,
);

final renewableLevel = LevelDataModel(
  id: 'LEVEL_2',
  image: Assets.images.solarPanel.path,
  title: 'Renewable Energy',
  concept: [
    'Investing in renewable energy sources like solar and wind power decreases reliance on fossil fuels, leading to cleaner air and reduced greenhouse gas emissions.',
    'Supporting renewable energy initiatives contributes to energy independence and resilience against fuel price fluctuations.',
    'Using renewable energy technologies promotes job creation and economic growth in the clean energy sector.',
    'Transitioning to renewable energy sources fosters innovation and technological advancements, driving sustainable development goals.',
  ],
  levelNumber: 2,
  color: ColorName.copperGold,
  items: ecoLife,
);

final recyclableLevel = LevelDataModel(
  id: 'LEVEL_4',
  image: Assets.images.recycleBg.path,
  title: 'Recycling',
  concept: [
    'Opting for recyclable materials reduces the strain on natural resources and minimizes the amount of waste sent to landfills.',
    'Recycling conserves energy by reducing the need for raw material extraction and manufacturing processes.',
    'Choosing recyclable products encourages a circular economy, where materials are reused, reducing the demand for virgin resources.',
    'Proper recycling practices help mitigate pollution and protect ecosystems from the harmful effects of waste accumulation.',
  ],
  levelNumber: 4,
  color: Colors.teal,
  items: recycleLevel,
);
