import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/screen/pokedex_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
