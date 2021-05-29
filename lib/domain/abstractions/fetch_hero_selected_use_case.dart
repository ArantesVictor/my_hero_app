import 'dart:io';

import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class FetchHeroSelectedUseCase {
  HeroModel getHeroSelected();
}
