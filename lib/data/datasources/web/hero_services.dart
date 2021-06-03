import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';

abstract class HeroServices {
  Future<List<HeroClass>> getAllClasses();
  Future<List<HeroBaseEquipament>> getEquipmentClass(String classe);
}
