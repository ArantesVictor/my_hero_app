import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_hero_app/data/datasources/web/hero_services.dart';
import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:my_hero_app/domain/model/hero_class.dart';
import 'package:my_hero_app/domain/model/hero_equipment.dart';

class HeroServicesImpl implements HeroServices {
  List<HeroClass> _classesList = [];
  List<HeroBaseEquipament> _equipmentList = [];
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

  @override
  Future<List<HeroBaseEquipament>> getEquipmentClass(String classe) async {
    final HeroClass myClass = _classesList.firstWhere(
      (element) => element.name == classe,
    );
    _equipmentList = [];
    final responce = await http.get(
      Uri.parse(_urlClasses + myClass.index),
    );

    final Map<dynamic, dynamic> mapResponse = jsonDecode(responce.body);

    final List<dynamic> dinamiclistEquipament =
        mapResponse['starting_equipment'];

    dinamiclistEquipament.forEach((itemList) {
      _equipmentList.add(
        HeroBaseEquipament(
          equipment: HeroEquipment(
            index: itemList['equipment']['index'].toString(),
            name: itemList['equipment']['name'].toString(),
            url: itemList['equipment']['url'].toString(),
          ),
          quantity: itemList['quantity'],
        ),
      );
    });

    return _equipmentList;
  }
}
