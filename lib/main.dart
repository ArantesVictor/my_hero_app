import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/presentation_flow/create_hero/presentation/create_hero_view.dart';
import 'package:my_hero_app/presentation_flow/delete_hero/presentation/delete_hero_view.dart';
import 'package:my_hero_app/presentation_flow/home/prensentation/home_view.dart';
import 'package:my_hero_app/presentation_flow/info_class/presentation/info_class_view.dart';
import 'package:my_hero_app/presentation_flow/read_hero/presentation/read_hero_view.dart';
import 'package:my_hero_app/presentation_flow/router/app_routes.dart';
import 'package:my_hero_app/presentation_flow/update_hero/presentation/update_hero_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => HeroProvider(),
      child: MaterialApp(
        title: 'My Hero App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.orangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeView(),
        routes: {
          AppRoutes.CREATE_HERO: (ctx) => CreateHero(),
          AppRoutes.READ_HERO: (ctx) => ReadHero(),
          AppRoutes.DELETE_HERO: (ctx) => DeleteHeroView(),
          AppRoutes.UPDATE_HERO: (ctx) => UpdateHeroView(),
          AppRoutes.INFO_CLASS: (ctx) => InfoClassView(),
        },
      ),
    );
  }
}
