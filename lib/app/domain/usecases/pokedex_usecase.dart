import '../entities/pokemon.entity.dart';
import '../repositories/pokedex.repository.dart';

class PokedexUsecase {
  final IPokeApiRepository repository;

  PokedexUsecase(this.repository);

  Future<List<Pokemon>> getPokemons({int? offset}) async {
    return await repository.getPokemons(offset: offset);
  }

  Future<Pokemon> getPokemon(String id) async {
    return await repository.getPokemon(id);
  }
}
