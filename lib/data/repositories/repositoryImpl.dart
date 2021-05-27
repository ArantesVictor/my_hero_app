import 'dart:io';

import 'package:my_hero_app/data/datasources/local/hero_data_base.dart';
import 'package:my_hero_app/data/models/flow_state.dart';
import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/abstractions/repository.dart';
import 'package:my_hero_app/domain/model/hero_classes.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

//Singleton devido ao factory toda vez que eu incializar uma nova instancia, ira pegar a mesma ja criada
//

class RepositoryImpl implements Repository {
  static RepositoryImpl _instance;

  final HeroDataBase dataBase = Inject.getHeroDataBase();

  final FlowState flowState = FlowState(heroSelected: '');

  static RepositoryImpl get instance {
    if (_instance == null) {
      _instance = RepositoryImpl();
    }
    return _instance;
  }

  @override
  HeroClasses getClasses() {
    // TODO: implement getClasses
  }

  @override
  List<HeroModel> getHeroList() {
    return dataBase.item;
  }

  @override
  void updateHeroSelected(String heroId) {
    flowState.heroSelected = heroId;
  }

  @override
  void addHero(String name, String classe, File image) {
    dataBase.addHero(name, classe, image);
  }
}
