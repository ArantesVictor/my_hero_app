import 'dart:io';

import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class Repository {
  Future<List<HeroClass>> getClasses();
  List<HeroModel> getHeroList();
  Future<List<HeroBaseEquipament>> getBaseEquipament(String classe);
  void addHero(String name, String classe, File image);
  void updateHero(String name, String classe, File image);
  void updateHeroSelected(String heroId);
  HeroModel getHeroSelected();
  bool deleteHeroSelected();
}
