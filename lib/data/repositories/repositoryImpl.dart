import 'dart:io';

import 'package:my_hero_app/data/datasources/local/hero_data_base.dart';
import 'package:my_hero_app/data/datasources/web/hero_services.dart';
import 'package:my_hero_app/data/models/flow_state.dart';
import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/abstractions/repository.dart';
import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

//Singleton devido ao factory toda vez que eu incializar uma nova instancia, ira pegar a mesma ja criada
//

class RepositoryImpl implements Repository {
  static RepositoryImpl _instance;

  final HeroDataBase dataBase = Inject.getHeroDataBase();

  final HeroServices services = Inject.getHeroServices();

  final FlowState flowState = FlowState(heroSelected: '');

  static RepositoryImpl get instance {
    if (_instance == null) {
      _instance = RepositoryImpl();
    }
    return _instance;
  }

  @override
  Future<List<HeroClass>> getClasses() async {
    return await services.getAllClasses();
  }

  @override
  Future<List<HeroBaseEquipament>> getBaseEquipament(String classe) async {
    return await services.getEquipmentClass(classe);
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

  @override
  HeroModel getHeroSelected() {
    return dataBase.searchById(flowState.heroSelected);
  }

  @override
  bool deleteHeroSelected() {
    return dataBase.deleteById(flowState.heroSelected);
  }

  @override
  void updateHero(String name, String classe, File image) {
    dataBase.updateHero(flowState.heroSelected, name, classe, image);
  }
}
