import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/presentation_flow/create_hero/domain/abstractions/get_classes_user_case.dart';
import 'package:my_hero_app/presentation_flow/create_hero/domain/interactors/get_classes_interactor.dart';
import 'package:my_hero_app/presentation_flow/delete_hero/domain/abstractions/delete_hero_selected_use_case.dart';
import 'package:my_hero_app/presentation_flow/delete_hero/domain/interactors/delete_hero_selected_interactor.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/update_hero_selected_use_case.dart';
import 'package:my_hero_app/domain/abstractions/fetch_hero_selected_use_case.dart';
import 'package:my_hero_app/presentation_flow/update_hero/domain/abistractions/update_hero_use_case.dart';
import 'package:my_hero_app/presentation_flow/update_hero/domain/interactors/update_hero_interactor.dart';

//cassos de uso interactor

class HeroProvider with ChangeNotifier {
  final FetchHeroListUseCase heroListInteractor =
      Inject.getFetchHeroListInteactor();
  final UpdateHeroSelectedUseCase updateHeroSelectedInteractor =
      Inject.getUpdateHeroSelectedInteractor();
  final FetchHeroSelectedUseCase fetchHeroSelected =
      Inject.getFetchHeroSelectedInteactor();
  final DeleteHeroSelectedUseCase deleteHeroSelectedInteractor =
      DeleteHeroSelectedInteractor();
  final GetClassesUserCase getClassesInteractor = GetClassesInteractor();

  final UpdatehHeroUseCase updateHeroInteractor = UpdateHeroInteractor();

  List<HeroModel> get item {
    return heroListInteractor.getHeroList();
  }

  int get itensCount {
    return heroListInteractor.getHeroList().length;
  }

  HeroModel itemByIndex(int index) {
    return heroListInteractor.getHeroList()[index];
  }

  HeroModel itemHeroSelected() {
    return fetchHeroSelected.getHeroSelected();
  }

  void addHero(String name, String classe, File image) {
    heroListInteractor.addHero(name, classe, image);
    notifyListeners();
  }

  void updateSelectedHero(String id) {
    updateHeroSelectedInteractor.updateHeroSelected(id);
  }

  void deleteHeroSelected() {
    if (deleteHeroSelectedInteractor.deleteHeroSelected()) {
      notifyListeners();
    }
  }

  Future<List<String>> getClasses() async {
    final List<HeroClass> response = await getClassesInteractor.getClasses();
    final List<String> allClasses = [];
    if (response != null) {
      response.forEach((element) {
        allClasses.add(element.name);
      });
    }
    return allClasses;
  }

  void updateHero(String name, String classe, File image) {
    updateHeroInteractor.updateHero(name, classe, image);
    notifyListeners();
  }
}
