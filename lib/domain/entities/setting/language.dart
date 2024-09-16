import 'package:brain_box_ai/core/utility/compare_string.dart';
import 'package:brain_box_ai/core/utility/scope_function.dart';
import 'package:collection/collection.dart';

import '../base_entity.dart';
import '../user_session.dart';

class Languages extends BaseEntity {
  final List<Language> languages;

  Languages({
    required this.languages,
  });

  Language? getLanguageByCode(String code) {
    return languages
        .firstWhereOrNull((element) => element.code.equalsIgnoreCase(code));
  }

  Language? getLanguageById(String id) {
    return languages
        .firstWhereOrNull((element) => element.id.equalsIgnoreCase(id));
  }

  Language? getLanguageByName(String name) {
    return languages
        .firstWhereOrNull((element) => element.name.equalsIgnoreCase(name));
  }

  List<Language> queryLanguagesByName(String name) {
    try {
      return languages
          .where((element) => element.name.containsIgnoreCase(element.name))
          .toList();
    } catch (e) {
      return [];
    }
  }

  List<Language> queryLanguagesByCode(String code) {
    try {
      return languages
          .where((element) => element.code.containsIgnoreCase(element.name))
          .toList();
    } catch (e) {
      return [];
    }
  }

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      languages:
          (json['languages'] as List).map((e) => Language.fromJson(e)).toList(),
    );
  }

  List<Language> filterItems(String query) {
    return queryLanguagesByName(query)
        .let((self) => (self.isEmpty) ? queryLanguagesByCode(query) : self)
        .let((self) => self);
  }

  Map<String, dynamic> toJson() {
    return {
      'languages': languages.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [languages];
}

class Language {
  final String? id;
  final String? name;
  final String? code;
  final String? coundtryCode;
  final String? image;
  const Language({
    this.id,
    this.name,
    this.code,
    this.image,
    this.coundtryCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Language &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          code == other.code &&
          coundtryCode == other.coundtryCode &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ code.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'LanguageEntity{ id: $id, name: $name, code: $code, image: $image}';
  }

  Language copyWith({
    String? id,
    String? name,
    String? code,
    String? image,
    String? countryCode,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      image: image ?? this.image,
      coundtryCode: countryCode ?? coundtryCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'image': image,
      'countryCode': coundtryCode,
    };
  }

  factory Language.fromJson(Map<String, dynamic> map) {
    return Language(
      id: map['id'] as String?,
      name: map['name'] as String?,
      code: map['code'] as String?,
      image: map['image'] as String?,
      coundtryCode: map['countryCode'] as String?,
    );
  }

  Language fromLocaleTag(String localeTag) {
    final locale = localeTag.toLowerCase().split('_');
    if (locale.length == 2) {
      return Language(
        code: locale[0].toLowerCase(),
        coundtryCode: locale[1].toLowerCase(),
      );
    }
    return Language(code: localeTag);
  }

  String getLocaleTag() {
    if (coundtryCode != null) {
      return '${code?.toLowerCase()}_${coundtryCode!.toUpperCase()}';
    }
    return code ?? '';
  }

  bool isSameLanguage(Language language) {
    return code.equalsIgnoreCase(language.code) &&
        coundtryCode.equalsIgnoreCase(language.coundtryCode);
  }
}
