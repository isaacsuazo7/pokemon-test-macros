import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonmacros/models/pokemon.dart';
import 'package:pokemonmacros/provider/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsyncValue = ref.watch(pokemonRandomFutureProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          'Pokemon Random',
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: pokemonAsyncValue.when(
            skipLoadingOnReload: false,
            skipLoadingOnRefresh: false,
            data: (pokemon) => _Pokemon(
                  pokemon: pokemon,
                ),
            error: (error, s) => const Text('Error al obtener el pokemon'),
            loading: () => const Center(
                  child: SizedBox(child: CircularProgressIndicator()),
                )),
      ),
      bottomSheet: const _Button(),
    );
  }
}

class _Pokemon extends StatelessWidget {
  final Pokemon pokemon;
  const _Pokemon({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PokemonImage(
            imageUrl: pokemon.sprites.other?.home.front_default ?? ''),
        _PokemonName(name: pokemon.name),
        _PokemonTypes(
          types: pokemon.types.map((type) => type.type.name).toList(),
        ),
      ],
    );
  }
}

class _PokemonImage extends StatelessWidget {
  final String imageUrl;
  const _PokemonImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 450,
      width: 300,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _PokemonName extends StatelessWidget {
  final String name;
  const _PokemonName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        name,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _PokemonTypes extends StatelessWidget {
  final List<String> types;
  const _PokemonTypes({required this.types});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Types:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey)),
          Wrap(
            children: types.map((type) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Chip(
                  backgroundColor: const Color.fromARGB(97, 26, 173, 70),
                  label: Text(
                    type,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          ref.invalidate(pokemonRandomFutureProvider);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.yellow),
          fixedSize: WidgetStateProperty.all(const Size(double.infinity, 65)),
        ),
        child: const Text('Obtener un pokemon aleatorio',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
