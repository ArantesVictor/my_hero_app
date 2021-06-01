import 'dart:io';

import 'package:flutter/material.dart';

class HeroModel {
  final String id;
  String name;
  String classe;
  File image;

  HeroModel({
    @required this.id,
    @required this.name,
    @required this.classe,
    @required this.image,
  });
}
