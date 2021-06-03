import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/domain/model/hero_base_equipment.dart';
import 'package:provider/provider.dart';

class InfoClassView extends StatefulWidget {
  @override
  _InfoClassViewState createState() => _InfoClassViewState();
}

class _InfoClassViewState extends State<InfoClassView> {
  bool _flag = true;
  bool _flagDetail = false;
  List<String> _listClass = [];
  List<String> _listEquipament = [];
  String _classSelectedController;

  var _dropdowList;

  void _dropdownController() {
    setState(() {
      _flagDetail = true;
    });

    HeroProvider()
      ..getBaseEquipament(_classSelectedController).then((value) {
        _listEquipament = [];
        setState(() {
          _listEquipament.addAll(value);
          _flagDetail = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_flag) {
      HeroProvider().getClasses().then((value) {
        if (_flag) {
          setState(() {
            _listClass.addAll(value);
            _classSelectedController = _listClass[0];
            _flag = false;
          });
        }
      });
    }
    _dropdowList = _listClass.map((balr) {
      return DropdownMenuItem<String>(
        value: balr,
        child: Text(balr),
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('About the classes'),
      ),
      body: _flag
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      items: _dropdowList,
                      onChanged: (String newValue) {
                        setState(() {
                          this._classSelectedController = newValue;
                        });
                        _dropdownController();
                      },
                      value: _classSelectedController,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Equipamentos:'),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _flagDetail
                        ? Center(child: CircularProgressIndicator())
                        : _listEquipament.isEmpty
                            ? Text('')
                            : Text(_listEquipament[0]),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
    );
  }
}
