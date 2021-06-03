import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:my_hero_app/presentation_flow/info_class/domain/abstractions/base_equipament_hero_use_case.dart';

class BaseEquipamentHeroInteractor implements BaseEquipamentHeroUseCase {
  var repository = Inject.getRepository();

  @override
  Future<List<HeroBaseEquipament>> getBaseEquipament(String classe) {
    return repository.getBaseEquipament(classe);
  }
}
