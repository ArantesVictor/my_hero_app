import 'package:flutter/painting.dart';
import 'package:my_hero_app/domain/model/hero_classes.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class Repository {
  HeroClasses getClasses();
  List<HeroModel> getHeroList();
  void updateHeroSelected(String heroId);
}
