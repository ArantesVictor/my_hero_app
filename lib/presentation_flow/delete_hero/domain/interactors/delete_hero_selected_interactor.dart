import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/presentation_flow/delete_hero/domain/abstractions/delete_hero_selected_use_case.dart';

class DeleteHeroSelectedInteractor implements DeleteHeroSelectedUseCase {
  @override
  bool deleteHeroSelected() {
    var repository = Inject.getRepository();
    return repository.deleteHeroSelected();
  }
}
