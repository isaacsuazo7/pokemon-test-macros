import 'package:json_annotation/json_annotation.dart';

part 'pokemon_js.g.dart';

@JsonSerializable()
class PokemonJS {
  final int id;
  final String name;
  final SpritesJS sprites;
  final List<TypeJS> types;

  PokemonJS({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });

  factory PokemonJS.fromJson(Map<String, dynamic> json) =>
      _$PokemonJSFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonJSToJson(this);
}

@JsonSerializable()
class OtherJS {
  final HomeJS home;

  OtherJS({
    required this.home,
  });

  factory OtherJS.fromJson(Map<String, dynamic> json) =>
      _$OtherJSFromJson(json);

  Map<String, dynamic> toJson() => _$OtherJSToJson(this);
}

@JsonSerializable()
class SpritesJS {
  final OtherJS? other;
  SpritesJS({required this.other});

  factory SpritesJS.fromJson(Map<String, dynamic> json) =>
      _$SpritesJSFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesJSToJson(this);
}

@JsonSerializable()
class HomeJS {
  final String front_default;

  HomeJS({required this.front_default});

  factory HomeJS.fromJson(Map<String, dynamic> json) => _$HomeJSFromJson(json);

  Map<String, dynamic> toJson() => _$HomeJSToJson(this);
}

@JsonSerializable()
class TypeJS {
  final SpeciesJS type;

  TypeJS({
    required this.type,
  });

  factory TypeJS.fromJson(Map<String, dynamic> json) => _$TypeJSFromJson(json);

  Map<String, dynamic> toJson() => _$TypeJSToJson(this);
}

@JsonSerializable()
class SpeciesJS {
  final String name;

  SpeciesJS({
    required this.name,
  });

  factory SpeciesJS.fromJson(Map<String, dynamic> json) =>
      _$SpeciesJSFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesJSToJson(this);
}
