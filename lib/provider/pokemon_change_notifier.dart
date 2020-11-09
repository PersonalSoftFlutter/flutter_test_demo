import 'package:flutter/cupertino.dart';
import 'package:poke_test/bloc/pokemon_cubit.dart';
import 'package:http/http.dart' as http;
import '../pokemon_entity.dart';
import '../pokemon_fetch.dart';

class PokemonChangeNotifier extends ChangeNotifier {
  PokemonChangeNotifier();

  PokemonState _state = PokemonState.none();
  PokemonState get state => _state;

  void updatePokemon(int id) async {
    if (id > 599) {
      id = 599;
    }
    _state = PokemonState.loading();
    notifyListeners();
    PokemonEntity pokemon = await PokemonFetch.getPokemon(http.Client(), id);
    _state = PokemonState.loaded(pokemon);
    notifyListeners();
  }
}
