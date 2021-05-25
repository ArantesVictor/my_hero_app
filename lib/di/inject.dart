import 'package:my_hero_app/data/repositories/repositoryImpl.dart';
import 'package:my_hero_app/domain/abstractions/repository.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/update_hero_selected_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/interactors/fetch_hero_list_interactor.dart';
import 'package:my_hero_app/presentation_flow/home/domain/interactors/update_hero_selected_interactor.dart';

class Inject {
  static Repository getRepository() {
    return RepositoryImpl();
  }

  static FetchHeroListUseCase getFetchHeroListInteactor() {
    return FetchHeroListInteractor();
  }

  static UpdateHeroSelectedUseCase getUpdateHeroSelectedInteractor() {
    return UpdateHeroSelectedInteractor();
  }
}
