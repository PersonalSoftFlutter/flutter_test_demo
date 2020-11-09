import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_test/pokemon_text_Field.dart';

void main() {
  testWidgets('PokemonTextField receives 99', (WidgetTester tester) async {
    String value = 99.toString();
    String valueToSearch = 99.toString();
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: PokemonTextField(value: value))));
    await tester.pump();
    final countWidget = find.text(valueToSearch);
    expect(countWidget, findsOneWidget);
  });

  testWidgets('PokemonTextField is empty', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: PokemonTextField())));
    await tester.pump();
    final countWidget = find.text('');
    expect(countWidget, findsOneWidget);
  });

  testWidgets('PokemonTextField is 42', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: PokemonTextField())));
    await tester.pump();
    final countWidget = find.text('');
    await tester.enterText(countWidget, 42.toString());
    await tester.pump();
    final updatedWidget = find.text(42.toString());
    expect(updatedWidget, findsOneWidget);
  });

  testWidgets('PokemonTextField is 999', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: PokemonTextField())));
    await tester.pump();
    final countWidget = find.text('');
    await tester.enterText(countWidget, 999.toString());
    await tester.pump();
    await tester.pump();
    await tester.pump();
    await tester.pump();
    final updatedWidget = find.text(599.toString());
    expect(updatedWidget, findsOneWidget);
  }, skip: true);
}
