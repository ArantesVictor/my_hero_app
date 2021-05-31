import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_hero_app/data/datasources/web/hero_services.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';

class HeroServicesImpl implements HeroServices {
  List<HeroClass> _classesList = [];
  final _urlClasses = 'https://www.dnd5eapi.co/api/classes/';

  @override
  Future<List<HeroClass>> getAllClasses() async {
    if (_classesList.length == 0) {
      final responce = await http.get(
        Uri.parse(_urlClasses),
      );

      final Map<dynamic, dynamic> mapResponse = jsonDecode(responce.body);

      final List<dynamic> dinamiclist = mapResponse['results'];

      dinamiclist.forEach((itemList) {
        _classesList.add(HeroClass(
          index: itemList['index'].toString(),
          name: itemList['name'].toString(),
          url: itemList['url'].toString(),
        ));
      });
    }
    return _classesList;
  }
}
