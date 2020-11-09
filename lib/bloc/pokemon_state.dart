part of 'pokemon_cubit.dart';

enum PokemonStatus { none, loading, failed, loaded }

class PokemonState extends Equatable {
  final PokemonStatus status;
  final PokemonEntity pokemon;
  const PokemonState._({
    this.status = PokemonStatus.none,
    this.pokemon,
  });

  const PokemonState.none() : this._(status: PokemonStatus.none);
  const PokemonState.loading() : this._(status: PokemonStatus.loading);
  const PokemonState.failed() : this._(status: PokemonStatus.failed);
  const PokemonState.loaded(PokemonEntity pokemon)
      : this._(status: PokemonStatus.loaded, pokemon: pokemon);

  @override
  List<Object> get props => [status, pokemon];
}
