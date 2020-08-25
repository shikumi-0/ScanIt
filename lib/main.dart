import 'package:flutter/material.dart';
import 'home_page.dart';
import 'generator.dart';
import 'scanner.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: HomePage.id,
    routes: {
      HomePage.id: (context) => HomePage(),
      QrScanner.id: (context) => QrScanner(),
      QrGenerator.id: (context) => QrGenerator(),
    },
  ));
}
