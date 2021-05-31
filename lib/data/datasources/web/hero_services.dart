import 'package:my_hero_app/domain/model/hero_class.dart';

abstract class HeroServices {
  Future<List<HeroClass>> getAllClasses();
}
