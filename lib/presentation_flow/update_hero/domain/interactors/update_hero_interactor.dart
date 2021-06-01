import 'dart:io';

import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/presentation_flow/update_hero/domain/abistractions/update_hero_use_case.dart';

class UpdateHeroInteractor implements UpdatehHeroUseCase {
  var repository = Inject.getRepository();
  @override
  void updateHero(String name, String classe, File image) {
    repository.updateHero(name, classe, image);
  }
}
