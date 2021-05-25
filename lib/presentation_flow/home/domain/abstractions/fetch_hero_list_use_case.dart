import 'package:my_hero_app/domain/model/hero_model.dart';

abstract class FetchHeroListUseCase {
  List<HeroModel> getHeroList();
}
