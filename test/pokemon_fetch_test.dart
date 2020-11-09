import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:poke_test/pokemon_entity.dart';
import 'package:poke_test/pokemon_fetch.dart';

class MockHTTPClient extends Mock implements http.Client {}

void main() {
  String stringResponse;
  setUp(() async {
    File file = File('../test_resources/pokemon001.json');
    stringResponse = await file.readAsString();
  });

  test('Download json from site', () async {
    final client = MockHTTPClient();
    when(client.get('https://pokeapi.co/api/v2/pokemon/1'))
        .thenAnswer((_) async => http.Response(stringResponse, 200));
    PokemonEntity pokemon = await PokemonFetch.getPokemon(client, 1);
    expect(pokemon.name, "bulbasaur");
    expect(pokemon.imageUrl,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
  });

  test('Fails to download json from site', () async {
    final client = MockHTTPClient();
    when(client.get('https://pokeapi.co/api/v2/pokemon/1'))
        .thenAnswer((_) async => http.Response(stringResponse, 400));
    expectLater(() => PokemonFetch.getPokemon(client, 1),
        throwsA(isInstanceOf<PokemonNotFoundException>()));
  });
}
