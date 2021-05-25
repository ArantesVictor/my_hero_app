import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';

class ReadHero extends StatefulWidget {
  // final HeroModel heroSelected;

  // ReadHero(this.heroSelected);
  @override
  _ReadHeroState createState() => _ReadHeroState();
}

class _ReadHeroState extends State<ReadHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Hero'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
