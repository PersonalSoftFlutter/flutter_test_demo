import 'dart:convert';

import 'package:poke_test/pokemon_entity.dart';
import 'package:http/http.dart' as http;

class PokemonFetch {
  static Future<PokemonEntity> getPokemon(http.Client client, int id) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$id";
    http.Response response = await client.get(url);
    if (response.statusCode == 400) {
      throw PokemonNotFoundException();
    }
    return PokemonEntity.fromJSON(jsonDecode(response.body));
  }
}
