import 'dart:io';

import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';

class FetchHeroListInteractor implements FetchHeroListUseCase {
  var repository = Inject.getRepository();

  @override
  List<HeroModel> getHeroList() {
    return repository.getHeroList();
  }

  @override
  void addHero(String name, String classe, File image) {
    repository.addHero(name, classe, image);
  }
}
