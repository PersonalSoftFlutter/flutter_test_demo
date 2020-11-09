import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_test/pokemon_entity.dart';

void main() {
  File file;
  setUp(() {
    try {
      file = File('..\\test_resources\\pokemon001.json'); //Command Line
    } catch (e) {
      file = File('test_resources\\pokemon001.json'); //IDE
    }
  });
  test('Test que recibe json, y devuelve un objeto pokemon', () async {
    final json = jsonDecode(await file.readAsString());
    PokemonEntity pokemon = PokemonEntity.fromJSON(json);
    expect(pokemon.name, 'bulbasaur');
    expect(pokemon.imageUrl,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
  });

  test('Test que recibe json vacio', () async {
    expect(() => PokemonEntity.fromJSON({}),
        throwsA(isInstanceOf<PokemonNotFoundException>()));
  });
}
