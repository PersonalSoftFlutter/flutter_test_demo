class PokemonEntity {
  String name;
  String imageUrl;

  PokemonEntity({this.name, this.imageUrl});

  factory PokemonEntity.fromJSON(Map<String, dynamic> json) {
    if (!json.containsKey('name')) {
      throw PokemonNotFoundException();
    }
    return PokemonEntity(
        name: json['name'], imageUrl: json['sprites']['front_default']);
  }
}

class PokemonNotFoundException implements Exception {}
