// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../country_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryModelAdapter extends TypeAdapter<CountryModel> {
  @override
  final int typeId = 5;

  @override
  CountryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryModel(
      id: fields[0] as int,
      name: fields[1] as String,
      alpha2: fields[2] as String,
      alpha3: fields[3] as String,
      dialCode: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.alpha2)
      ..writeByte(3)
      ..write(obj.alpha3)
      ..writeByte(4)
      ..write(obj.dialCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      alpha2: json['alpha2'] as String,
      alpha3: json['alpha3'] as String,
      dialCode: json['dialCode'] as String,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alpha2': instance.alpha2,
      'alpha3': instance.alpha3,
      'dialCode': instance.dialCode,
    };
