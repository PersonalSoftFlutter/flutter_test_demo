import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_test/pokemon_text_Field.dart';
import 'package:poke_test/provider/pokemon_change_notifier.dart';
import 'package:provider/provider.dart';

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
    return Consumer<PokemonChangeNotifier>(
      builder: (BuildContext context, PokemonChangeNotifier pcn, Widget child) {
        switch (pcn.state.status) {
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
            name = pcn.state.pokemon.name;
            url = pcn.state.pokemon.imageUrl;
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
                      Provider.of<PokemonChangeNotifier>(context, listen: false)
                          .updatePokemon(id),
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
