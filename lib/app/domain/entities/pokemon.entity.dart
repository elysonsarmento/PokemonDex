class Pokemon {
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

  Pokemon({
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

  @override
  String toString() =>
      'Pokemon(id: $id, name: $name, sprite: $sprite, type1: $type1, type2: $type2, hp: $hp, attack: $attack, defense: $defense, speed: $speed, spAttack: $spAttack, spDefense: $spDefense, description: $description, height: $height, weight: $weight, species: $species, ability1: $ability1, ability2: $ability2, ability3: $ability3, moves: $moves)';
}
