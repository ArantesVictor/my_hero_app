import 'package:my_hero_app/domain/model/hero_base_equipment.dart';

abstract class BaseEquipamentHeroUseCase {
  Future<List<HeroBaseEquipament>> getBaseEquipament(String classe);
}
