import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pokemonmacros/models/pokemon.dart';

final pokemonRandomFutureProvider = FutureProvider.autoDispose((ref) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomPokemonId'));

  return Pokemon.fromJson(jsonDecode(response.body));
});

int get randomPokemonId {
  return Random().nextInt(1025) + 1;
}
