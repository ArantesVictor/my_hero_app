import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/update_hero_selected_use_case.dart';

//cassos de uso interactor

class HeroProvider with ChangeNotifier {
  final FetchHeroListUseCase heroListInteractor =
      Inject.getFetchHeroListInteactor();
  final UpdateHeroSelectedUseCase updateHeroSelectedInteractor =
      Inject.getUpdateHeroSelectedInteractor();

  List<HeroModel> get item {
    return heroListInteractor.getHeroList();
  }

  int get itensCount {
    return heroListInteractor.getHeroList().length;
  }

  HeroModel itemByIndex(int index) {
    return heroListInteractor.getHeroList()[index];
  }

  void addHero(String name, String classe, File image) {
    heroListInteractor.addHero(name, classe, image);
    notifyListeners();
  }

  void updateSelectedHero(String id) {
    updateHeroSelectedInteractor.updateHeroSelected(id);
  }
}
