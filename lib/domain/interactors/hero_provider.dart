import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

//cassos de uso interactor

class HeroProvider with ChangeNotifier {
  List<HeroModel> _items = [];

  List<HeroModel> get item {
    return [..._items];
  }

  int get itensCount {
    return _items.length;
  }

  HeroModel itemByIndex(int index) {
    return _items[index];
  }

  void addHero(String name, String classe, File image) {
    final newCharacter = HeroModel(
      id: Random().nextDouble().toString(),
      name: name,
      classe: classe,
      image: image,
    );
    _items.add(newCharacter);
    // DataBaseUtil.inserts('character', {
    //   'id': newCharacter.id,
    //   'name': newCharacter.name,
    //   'class': newCharacter.classe,
    //   'image': newCharacter.image.path,
    // });
    notifyListeners();
  }
}
