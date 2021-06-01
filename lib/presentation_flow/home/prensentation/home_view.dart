import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/presentation_flow/router/app_routes.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.article_outlined),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.INFO_CLASS);
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<HeroProvider>(
          child: Center(
            child: Text('No Hero Was Create Yet'),
          ),
          builder: (ctx, heroProvider, child) => heroProvider.itensCount == 0
              ? child
              : ListView.builder(
                  itemCount: heroProvider.itensCount.toInt(),
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(heroProvider.itemByIndex(i).image),
                    ),
                    title: Text(heroProvider.itemByIndex(i).name),
                    onTap: () {
                      heroProvider
                          .updateSelectedHero(heroProvider.itemByIndex(i).id);

                      Navigator.of(context).pushNamed(
                        AppRoutes.READ_HERO,
                      );
                    },
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Hero',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CREATE_HERO);
        },
      ),
    );
  }
}
