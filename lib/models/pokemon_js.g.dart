// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_js.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonJS _$PokemonJSFromJson(Map<String, dynamic> json) => PokemonJS(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sprites: SpritesJS.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((e) => TypeJS.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonJSToJson(PokemonJS instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'types': instance.types,
    };

OtherJS _$OtherJSFromJson(Map<String, dynamic> json) => OtherJS(
      home: HomeJS.fromJson(json['home'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherJSToJson(OtherJS instance) => <String, dynamic>{
      'home': instance.home,
    };

SpritesJS _$SpritesJSFromJson(Map<String, dynamic> json) => SpritesJS(
      other: json['other'] == null
          ? null
          : OtherJS.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesJSToJson(SpritesJS instance) => <String, dynamic>{
      'other': instance.other,
    };

HomeJS _$HomeJSFromJson(Map<String, dynamic> json) => HomeJS(
      front_default: json['front_default'] as String,
    );

Map<String, dynamic> _$HomeJSToJson(HomeJS instance) => <String, dynamic>{
      'front_default': instance.front_default,
    };

TypeJS _$TypeJSFromJson(Map<String, dynamic> json) => TypeJS(
      type: SpeciesJS.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeJSToJson(TypeJS instance) => <String, dynamic>{
      'type': instance.type,
    };

SpeciesJS _$SpeciesJSFromJson(Map<String, dynamic> json) => SpeciesJS(
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpeciesJSToJson(SpeciesJS instance) => <String, dynamic>{
      'name': instance.name,
    };
