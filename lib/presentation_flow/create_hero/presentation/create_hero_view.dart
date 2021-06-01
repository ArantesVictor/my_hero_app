import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_hero_app/common/widget/image_imput.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';

import 'package:provider/provider.dart';

class CreateHero extends StatefulWidget {
  @override
  _CreateHeroState createState() => _CreateHeroState();
}

class _CreateHeroState extends State<CreateHero> {
  final _nameController = TextEditingController();
  String _classSelectedController;

  var _dropdowList;
  bool _flag = true;
  List<String> _listClass = [];
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _dropdownController() {
    return;
  }

  void _submitForm() {
    if (_nameController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<HeroProvider>(context, listen: false).addHero(
      _nameController.text,
      _classSelectedController,
      _pickedImage,
    );

    Navigator.of(context).pop();
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
        title: Text("Create Hero"),
      ),
      body: _flag
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ImageInput(this._selectImage),
                        SizedBox(height: 10),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: _submitForm,
                    child: Text('Salvar'),
                  )
                ],
              ),
            ),
    );
  }
}
