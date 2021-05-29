import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_hero_app/common/widget/image_imput.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:my_hero_app/presentation_flow/router/app_routes.dart';

class ReadHero extends StatefulWidget {
  //interacgtor paacbuscar o hero selecionado
  //final HeroModel heroSelected;

  @override
  _ReadHeroState createState() => _ReadHeroState();
}

class _ReadHeroState extends State<ReadHero> {
  @override
  Widget build(BuildContext context) {
    HeroModel _myHero = HeroProvider().itemHeroSelected();
    return Scaffold(
      appBar: AppBar(
        title: Text(_myHero.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        child: Image.file(
                          _myHero.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(_myHero.classe),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.DELETE_HERO);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  child: Text('Edit'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.UPDATE_HERO);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
