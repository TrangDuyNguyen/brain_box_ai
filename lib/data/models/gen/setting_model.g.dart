// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../setting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingModelAdapter extends TypeAdapter<SettingModel> {
  @override
  final int typeId = 3;

  @override
  SettingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingModel(
      languageCode: fields[0] as String,
      currencyCode: fields[1] as String,
      countryCode: fields[2] as String,
      theme: fields[3] as String,
      notificationEnabled: fields[4] as bool,
      isInstalled: fields[5] as bool,
      supportCurrencies: (fields[6] as List).cast<CurrencyModel>(),
      supportLanguages: (fields[7] as List).cast<LanguageModel>(),
      supportCountries: (fields[8] as List).cast<CountryModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SettingModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.languageCode)
      ..writeByte(1)
      ..write(obj.currencyCode)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.theme)
      ..writeByte(4)
      ..write(obj.notificationEnabled)
      ..writeByte(5)
      ..write(obj.isInstalled)
      ..writeByte(6)
      ..write(obj.supportCurrencies)
      ..writeByte(7)
      ..write(obj.supportLanguages)
      ..writeByte(8)
      ..write(obj.supportCountries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) => SettingModel(
      languageCode: json['languageCode'] as String,
      currencyCode: json['currencyCode'] as String,
      countryCode: json['countryCode'] as String,
      theme: json['theme'] as String,
      notificationEnabled: json['notificationEnabled'] as bool,
      isInstalled: json['isInstalled'] as bool,
      supportCurrencies: (json['supportCurrencies'] as List<dynamic>)
          .map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportLanguages: (json['supportLanguages'] as List<dynamic>)
          .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportCountries: (json['supportCountries'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SettingModelToJson(SettingModel instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'currencyCode': instance.currencyCode,
      'countryCode': instance.countryCode,
      'theme': instance.theme,
      'notificationEnabled': instance.notificationEnabled,
      'isInstalled': instance.isInstalled,
      'supportCurrencies':
          instance.supportCurrencies.map((e) => e.toJson()).toList(),
      'supportLanguages':
          instance.supportLanguages.map((e) => e.toJson()).toList(),
      'supportCountries':
          instance.supportCountries.map((e) => e.toJson()).toList(),
    };
