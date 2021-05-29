//classe
//para manipular bnco de daos
//CRUD
// pegar o provider e trazer pra k

import 'dart:io';

import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class HeroDataBase {
  List<HeroModel> get item;
  void addHero(String name, String classe, File image);
  HeroModel searchById(String id);
}
