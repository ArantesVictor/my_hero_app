import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';

class FetchHeroListInteractor implements FetchHeroListUseCase {
  @override
  List<HeroModel> getHeroList() {
    var repository = Inject.getRepository();
    return repository.getHeroList();
  }
}
