import 'package:my_hero_app/domain/model/hero_class.dart';

abstract class GetClassesUserCase {
  Future<List<HeroClass>> getClasses();
}
