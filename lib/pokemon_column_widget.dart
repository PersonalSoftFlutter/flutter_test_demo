import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_test/pokemon_text_Field.dart';

import 'bloc/pokemon_cubit.dart';

class PokemonColumnWidget extends StatefulWidget {
  @override
  _PokemonColumnWidgetState createState() => _PokemonColumnWidgetState();
}

class _PokemonColumnWidgetState extends State<PokemonColumnWidget> {
  int id = 0;
  String name = '';
  String url = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (BuildContext context, PokemonState state) {
        switch (state.status) {
          case PokemonStatus.none:
            name = '';
            url = '';
            isLoading = false;
            break;
          case PokemonStatus.loading:
            isLoading = true;
            name = '';
            url = '';
            break;
          case PokemonStatus.failed:
            isLoading = false;
            name = 'Error';
            url = '';
            break;
          case PokemonStatus.loaded:
            isLoading = false;
            name = state.pokemon.name;
            url = state.pokemon.imageUrl;
            break;
        }
        return Stack(
          children: [
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox.shrink(),
            Column(
              children: [
                PokemonTextField(
                  onChanged: (value) {
                    id = value;
                  },
                ),
                RaisedButton(
                  onPressed: () =>
                      BlocProvider.of<PokemonCubit>(context).updatePokemon(id),
                ),
                Text(name),
                Image.network(url),
              ],
            ),
          ],
        );
      },
    );
  }
}
