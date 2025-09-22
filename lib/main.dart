import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/screen/pokedex_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokedex',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const PokedexScreen(),
    );
  }
}
