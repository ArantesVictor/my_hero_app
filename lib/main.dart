import 'package:flutter/material.dart';
import 'package:my_hero_app/domain/interactors/hero_provider.dart';
import 'package:my_hero_app/presentation_flow/create_hero/presentation/create_hero_view.dart';
import 'package:my_hero_app/presentation_flow/home/prensentation/home_view.dart';
import 'package:my_hero_app/presentation_flow/read_hero/presentation/read_hero_view.dart';
import 'package:my_hero_app/presentation_flow/router/app_routes.dart';
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
        },
      ),
    );
  }
}
