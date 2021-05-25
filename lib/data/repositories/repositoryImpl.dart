import 'package:my_hero_app/data/models/flow_state.dart';
import 'package:my_hero_app/domain/abstractions/repository.dart';
import 'package:my_hero_app/domain/model/hero_classes.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

//Singleton
//

class RepositoryImpl implements Repository {
  final FlowState flowState = FlowState(heroSelected: '');

  @override
  HeroClasses getClasses() {
    // TODO: implement getClasses
  }

  @override
  List<HeroModel> getHeroList() {
    // chamar data source com os herois
    throw UnimplementedError();
  }

  @override
  void updateHeroSelected(String heroId) {
    flowState.heroSelected = heroId;
  }
}
