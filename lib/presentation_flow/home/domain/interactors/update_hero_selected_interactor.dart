import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/update_hero_selected_use_case.dart';

class UpdateHeroSelectedInteractor implements UpdateHeroSelectedUseCase {
  @override
  void updateHeroSelected(String heroId) {
    var repository = Inject.getRepository();
    repository.updateHeroSelected(heroId);
  }
}
