import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/domain/abstractions/fetch_hero_selected_use_case.dart';

class FetchHeroSelectedInteractor implements FetchHeroSelectedUseCase {
  var repository = Inject.getRepository();

  @override
  HeroModel getHeroSelected() {
    return repository.getHeroSelected();
  }
}
