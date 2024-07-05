import '../../domain/entities/pokemon.entity.dart';

class PokemonModel extends Pokemon {
  String? id;
  String? name;
  String? sprite;
  String? type1;
  String? type2;
  double? hp;
  double? attack;
  double? defense;
  double? speed;
  double? spAttack;
  double? spDefense;
  String? description;
  int? height;
  int? weight;
  String? species;
  String? ability1;
  String? ability2;
  String? ability3;
  List<String>? moves;

  PokemonModel({
    this.id,
    this.name,
    this.sprite,
    this.type1,
    this.type2,
    this.hp,
    this.attack,
    this.defense,
    this.speed,
    this.spAttack,
    this.spDefense,
    this.description,
    this.height,
    this.weight,
    this.species,
    this.ability1,
    this.ability2,
    this.ability3,
    this.moves,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    String pokeId = json['name'];
    int? hp = json['stats']?[0]['base_stat'];
    int? attack = json['stats']?[1]['base_stat'];
    int? defense = json['stats']?[2]['base_stat'];
    int? spAttack = json['stats']?[3]['base_stat'];
    int? spDefense = json['stats']?[4]['base_stat'];
    int? speed = json['stats']?[5]['base_stat'];
    List? descList = json['flavor_text_entries'];
    int? descIndex;
    if (descList != null)
      for (int i = 0; i < descList.length; i++) {
        var desc = json['flavor_text_entries'][i]['language']['name'];
        if (desc == 'en') {
          descIndex = i;
        }
      }
    String? pokeDesc = json.containsKey('flavor_text_entries')
        ? json['flavor_text_entries'][descIndex]['flavor_text']
        : null;
    String? pokeSpec =
        json.containsKey('genera') ? json['genera'][7]['genus'] : null;
    double pokeHp = hp != null ? hp / 100 : 0;
    double pokeAttack = attack == null ? 0 : attack / 100;
    double? pokeDef = defense == null ? null : defense / 100;
    double? pokeSpAttack = spAttack == null ? null : spAttack / 100;
    double? pokespDefense = spDefense == null ? null : spDefense / 100;
    double? pokeSpeed = speed == null ? null : speed / 100;
    List? abilities = json['abilities'];
    List? types = json['types'];
    List? movesList = json['moves'];
    List<String>? tempMovesList = <String>[];
    if (movesList != null)
      for (int i = 0; i < movesList.length; i++) {
        var moves = json['moves'][i]['move']['name'];
        tempMovesList.add(moves);
      }

    return PokemonModel(
      id: pokeId,
      name: json['name'],
      sprite: json['sprites']?['front_default'],
      type1: json['types']?[0]['type']['name'],
      type2: types?.length == 2 ? json['types'][1]['type']['name'] : null,
      hp: pokeHp,
      attack: pokeAttack,
      defense: pokeDef,
      speed: pokeSpeed,
      spAttack: pokeSpAttack,
      spDefense: pokespDefense,
      description: pokeDesc,
      height: json['height'],
      weight: json['weight'],
      species: pokeSpec,
      ability1: json['abilities']?[0]['ability']['name'],
      ability2: (abilities != null && abilities.length >= 2)
          ? json['abilities'][1]['ability']['name']
          : '',
      ability3: (abilities != null && abilities.length >= 3)
          ? json['abilities'][2]['ability']['name']
          : '',
      moves: tempMovesList,
    );
  }

  PokemonModel copyWith(
    PokemonModel pokemon,
  ) {
    return PokemonModel(
      id: pokemon.id ?? this.id,
      name: pokemon.name ?? this.name,
      sprite: pokemon.sprite ?? this.sprite,
      type1: pokemon.type1 ?? this.type1,
      type2: pokemon.type2 ?? this.type2,
      hp: pokemon.hp ?? this.hp,
      attack: pokemon.attack ?? this.attack,
      defense: pokemon.defense ?? this.defense,
      speed: pokemon.speed ?? this.speed,
      spAttack: pokemon.spAttack ?? this.spAttack,
      spDefense: pokemon.spDefense ?? this.spDefense,
      description: pokemon.description ?? this.description,
      height: pokemon.height ?? this.height,
      weight: pokemon.weight ?? this.weight,
      species: pokemon.species ?? this.species,
      ability1: pokemon.ability1 ?? this.ability1,
      ability2: pokemon.ability2 ?? this.ability2,
      ability3: pokemon.ability3 ?? this.ability3,
      moves: pokemon.moves ?? this.moves,
    );
  }

  PokemonModel copyWithFromModel(PokemonModel pokemon) {
    return PokemonModel(
      id: pokemon.id ?? this.id,
      name: pokemon.name ?? this.name,
      sprite: pokemon.sprite ?? this.sprite,
      type1: pokemon.type1 ?? this.type1,
      type2: pokemon.type2 ?? this.type2,
      hp: pokemon.hp ?? this.hp,
      attack: pokemon.attack ?? this.attack,
      defense: pokemon.defense ?? this.defense,
      speed: pokemon.speed ?? this.speed,
      spAttack: pokemon.spAttack ?? this.spAttack,
      spDefense: pokemon.spDefense ?? this.spDefense,
      description: pokemon.description ?? this.description,
      height: pokemon.height ?? this.height,
      weight: pokemon.weight ?? this.weight,
      species: pokemon.species ?? this.species,
      ability1: pokemon.ability1 ?? this.ability1,
      ability2: pokemon.ability2 ?? this.ability2,
      ability3: pokemon.ability3 ?? this.ability3,
      moves: pokemon.moves ?? this.moves,
    );
  }
}
