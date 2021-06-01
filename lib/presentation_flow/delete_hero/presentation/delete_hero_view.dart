import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/domain/model/hero_model.dart';
import 'package:provider/provider.dart';

class DeleteHeroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HeroModel _myHero = HeroProvider().itemHeroSelected();
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete hero ${_myHero.name} '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You shure abolt delete the ${_myHero.name}?',
              ),
            ],
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
                  Provider.of<HeroProvider>(
                    context,
                    listen: false,
                  ).deleteHeroSelected();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                ),
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
