import 'package:json/json.dart';

@JsonCodable()
class Pokemon {
  final int id;
  final String name;
  final Sprites sprites;
  final List<Type> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });
}

@JsonCodable()
class Other {
  final Home home;

  Other({
    required this.home,
  });
}

@JsonCodable()
class Sprites {
  final Other? other;
  Sprites({required this.other});
}

@JsonCodable()
class Home {
  final String front_default;

  Home({required this.front_default});
}

@JsonCodable()
class Type {
  final Species type;

  Type({
    required this.type,
  });
}

@JsonCodable()
class Species {
  final String name;

  Species({
    required this.name,
  });
}
