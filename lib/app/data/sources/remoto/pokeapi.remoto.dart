import 'package:dio/dio.dart';
import 'package:flutterdex/app/data/models/pokemon.dart';

class PokeApiRemoto {
  final _requester = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ),
  );

  Future<List<PokemonModel>> getPokemons({int? offset}) async {
    final response = await _requester.get(
      "/pokemon",
      queryParameters: {
        'limit': 20,
        'offset': offset ?? 0,
      },
    );

    final List<PokemonModel> pokemons = [];
    for (final item in response.data['results']) {
      final pokemon = await getPokemon(item['name']);
      pokemons.add(pokemon);
    }

    return pokemons;
  }

  Future<PokemonModel> getPokemonSpecies(String id) async {
    final response = await _requester.get(
      "/pokemon-species/$id",
    );

    return PokemonModel.fromJson(response.data);
  }

  Future<PokemonModel> getPokemon(String id) async {
    final response = await _requester.get(
      "/pokemon/$id",
    );

    return PokemonModel.fromJson(response.data);
  }
}
