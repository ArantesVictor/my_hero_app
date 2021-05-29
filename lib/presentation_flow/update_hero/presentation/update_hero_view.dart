import 'package:flutter/material.dart';

class UpdateHeroView extends StatefulWidget {
  @override
  _UpdateHeroViewState createState() => _UpdateHeroViewState();
}

class _UpdateHeroViewState extends State<UpdateHeroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ypdate Hero'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
