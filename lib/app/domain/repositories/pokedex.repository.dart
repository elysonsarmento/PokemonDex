import 'package:flutterdex/app/domain/entities/pokemon.entity.dart';

abstract class IPokeApiRepository {
  Future<List<Pokemon>> getPokemons({int? offset});

  Future<Pokemon> getPokemon(String id);
}
