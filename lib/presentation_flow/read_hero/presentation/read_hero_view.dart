import 'package:flutter/material.dart';
import 'package:my_hero_app/common/widget/image_imput.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

class ReadHero extends StatefulWidget {
  //interacgtor paacbuscar o hero selecionado
  //final HeroModel heroSelected;

  @override
  _ReadHeroState createState() => _ReadHeroState();
}

class _ReadHeroState extends State<ReadHero> {
  @override
  Widget build(BuildContext context) {
    HeroModel _myHero = ModalRoute.of(context).settings.arguments;
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
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text('salve'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(_myHero.classe),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {},
              child: Text('Delete'),
            )
          ],
        ),
      ),
    );
  }
}
