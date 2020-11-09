import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_test/pokemon_entity.dart';
import 'package:http/http.dart' as http;

import '../pokemon_fetch.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonState.none());

  void updatePokemon(int id) async {
    if (id > 599) {
      id = 599;
    }
    emit(PokemonState.loading());
    PokemonEntity pokemon = await PokemonFetch.getPokemon(http.Client(), id);
    emit(PokemonState.loaded(pokemon));
  }
}
