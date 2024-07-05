import 'package:flutterdex/app/data/models/pokemon.dart';
import 'package:flutterdex/app/data/sources/remoto/pokeapi.remoto.dart';
import 'package:flutterdex/app/domain/entities/pokemon.entity.dart';
import 'package:flutterdex/app/domain/repositories/pokedex.repository.dart';

class PokeApiRepository implements IPokeApiRepository {
  final PokeApiRemoto _pokeApiRemoto;

  PokeApiRepository({required PokeApiRemoto pokeApiRemoto})
      : _pokeApiRemoto = pokeApiRemoto;
  @override
  Future<Pokemon> getPokemon(String id) async {
    PokemonModel pokemon = await _pokeApiRemoto.getPokemon(id);
    PokemonModel species = await _pokeApiRemoto.getPokemonSpecies(id);

    pokemon = pokemon.copyWith(
      species,
    );
    return pokemon;
  }

  @override
  Future<List<Pokemon>> getPokemons({int? offset}) async {
    return await _pokeApiRemoto.getPokemons(offset: offset);
  }
}
