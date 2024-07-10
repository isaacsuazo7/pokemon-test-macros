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

class Other {
  final Home home;

  Other({
    required this.home,
  });
}

class Sprites {
  final Other? other;
  Sprites({required this.other});
}

class Home {
  final String front_default;

  Home({required this.front_default});
}

class Type {
  final Species type;

  Type({
    required this.type,
  });
}

class Species {
  final String name;

  Species({
    required this.name,
  });
}
