import 'package:flutter/material.dart';
import 'package:my_hero_app/di/inject.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/fetch_hero_list_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/abstractions/update_hero_selected_use_case.dart';
import 'package:my_hero_app/presentation_flow/home/domain/interactors/fetch_hero_list_interactor.dart';
import 'package:my_hero_app/presentation_flow/router/app_routes.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final FetchHeroListUseCase heroListInteractor =
      Inject.getFetchHeroListInteactor();
  final UpdateHeroSelectedUseCase updateHeroSelectedInteractor =
      Inject.getUpdateHeroSelectedInteractor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer<HeroProvider>(
          //child: Consumer<FetchHeroListInteractor>(
          child: Center(
            child: Text('No Hero Was Create Yet'),
          ),
          builder: (ctx, charterProvider, child) =>
              charterProvider.itensCount == 0
                  ? child
                  
                  : ListView.builder(
                      itemCount: charterProvider.itensCount.toInt(),
                      //itemCount: heroListInteractor.getHeroList().length,
                      itemBuilder: (ctx, i) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(charterProvider.itemByIndex(i).image),
                        ),
                        title: Text(charterProvider.itemByIndex(i).name),
                        onTap: () {
                          updateHeroSelectedInteractor.updateHeroSelected(
                              charterProvider.itemByIndex(i).id);
                          Navigator.of(context).pushNamed(AppRoutes.READ_HERO);
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
