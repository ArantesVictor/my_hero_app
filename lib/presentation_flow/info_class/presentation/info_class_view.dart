import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';

class InfoClassView extends StatefulWidget {
  @override
  _InfoClassViewState createState() => _InfoClassViewState();
}

class _InfoClassViewState extends State<InfoClassView> {
  bool _flag = true;
  List<String> _listClass = [];
  String _classSelectedController;

  var _dropdowList;

  void _dropdownController() {
    return;
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
            print('Printssssssss');
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
                      },
                      value: _classSelectedController,
                      onTap: _dropdownController,
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
    );
  }
}
