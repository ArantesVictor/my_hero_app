import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/model/hero_classes.dart';
import 'package:my_hero_app/presentation_flow/create_hero/domain/abstractions/get_classes_user_case.dart';

class GetClassesInteractor implements GetClassesUserCase {
  @override
  HeroClasses getClasses() {
    var repository = Inject.getRepository();
    return repository.getClasses();
  }
}
