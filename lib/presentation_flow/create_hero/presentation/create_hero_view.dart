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
  final _classController = TextEditingController();
  // String _classSelectedController = 'Select...';

  final List<String> _listClass = [];
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  // void _dropdownController() {
  //   return;
  // }

  void _submitForm() {
    if (_nameController.text.isEmpty ||
        _classController.text.isEmpty ||
        _pickedImage == null) {
      return;
    }

    Provider.of<HeroProvider>(context, listen: false).addHero(
      _nameController.text,
      _classController.text,
      _pickedImage,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    HeroProvider().getClasses().then((value) {
      _listClass.addAll(value);
    });
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Hero"),
      ),
      body: SingleChildScrollView(
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
                  TextField(
                    controller: _classController,
                    decoration: InputDecoration(
                      labelText: 'Classe',
                    ),
                  ),
                  // SizedBox(height: 10),
                  // DropdownButton<String>(
                  //   items: _listClass.map((DropdownStringItem) {
                  //     return DropdownMenuItem<String>(
                  //       value: DropdownStringItem,
                  //       child: Text(DropdownStringItem),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String newValue) {
                  //     setState(() {
                  //       this._classSelectedController = newValue;
                  //     });
                  //   },
                  //   value: _classSelectedController,
                  //   onTap: _dropdownController,
                  // ),
                  // SizedBox(height: 40),
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
