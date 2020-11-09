import 'package:flutter/material.dart';

typedef OnChanged(int id);

class PokemonTextField extends StatelessWidget {
  PokemonTextField({this.value, this.onChanged});
  OnChanged onChanged;
  TextEditingController _controller = TextEditingController();
  final String value;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: (value) {
        if (int.parse(value) > 599) {
          _controller.text = 599.toString();
        }
        onChanged(int.parse(value));
      },
    );
  }
}
