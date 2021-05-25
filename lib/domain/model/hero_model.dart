import 'dart:io';

import 'package:flutter/material.dart';

class HeroModel {
  final String id;
  final String name;
  final String classe;
  final File image;

  HeroModel({
    @required this.id,
    @required this.name,
    @required this.classe,
    @required this.image,
  });
}
