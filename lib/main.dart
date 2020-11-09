import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_test/bloc/pokemon_cubit.dart';
import 'package:poke_test/pokemon_column_widget.dart';
import 'package:poke_test/pokemon_entity.dart';
import 'package:poke_test/pokemon_fetch.dart';
import 'package:poke_test/pokemon_text_Field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<PokemonCubit>(
          create: (context) => PokemonCubit(),
          child: PokemonColumnWidget(),
        ),
      ),
    );
  }
}
