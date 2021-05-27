import 'dart:io';

import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class FetchHeroListUseCase {
  List<HeroModel> getHeroList();
  void addHero(String name, String classe, File image);
}
