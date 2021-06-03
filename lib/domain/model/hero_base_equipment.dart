import 'package:flutter/material.dart';

import 'hero_equipment.dart';

class HeroBaseEquipament {
  final HeroEquipment equipment;
  final int quantity;

  HeroBaseEquipament({
    @required this.equipment,
    @required this.quantity,
  });
}
