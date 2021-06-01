import 'dart:io';
import 'dart:math';

import 'package:my_hero_app/data/datasources/local/hero_data_base.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

class HeroDataBaseImpl implements HeroDataBase {
  List<HeroModel> _items = [];

  @override
  List<HeroModel> get item {
    return [..._items];
  }

  @override
  void addHero(String name, String classe, File image) {
    final newCharacter = HeroModel(
      id: Random().nextDouble().toString(),
      name: name,
      classe: classe,
      image: image,
    );
    _items.add(newCharacter);
  }

  @override
  HeroModel searchById(id) {
    return _items.firstWhere((element) => identical(element.id, id));
  }

  @override
  bool deleteById(id) {
    return _items
        .remove(_items.firstWhere((element) => identical(element.id, id)));
  }

  @override
  void updateHero(String id, String name, String classe, File image) {
    _items.firstWhere((element) => identical(element.id, id)).name = name;
    _items.firstWhere((element) => identical(element.id, id)).classe = classe;
    _items.firstWhere((element) => identical(element.id, id)).image = image;
  }
}
