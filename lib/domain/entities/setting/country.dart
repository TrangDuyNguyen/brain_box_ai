import 'package:brain_box_ai/core/utility/compare_string.dart';
import 'package:brain_box_ai/core/utility/scope_function.dart';

import '../user_session.dart';
import 'package:collection/collection.dart';

class Countries extends BaseEntity {
  final List<Country> countries;

  factory Countries.empty() => Countries(countries: const []);

  Countries({
    required this.countries,
  });

  Country? getCountryByAlpha2(String alpha2) {
    return countries
        .firstWhereOrNull((element) => element.alpha2.equalsIgnoreCase(alpha2));
  }

  Country? getCountryByAlpha3(String alpha3) {
    return countries
        .firstWhereOrNull((element) => element.alpha3.equalsIgnoreCase(alpha3));
  }

  Country? getCountryById(num id) {
    return countries.firstWhereOrNull(
        (element) => element.id.toString().equalsIgnoreCase(id.toString()));
  }

  Country? getCountryByName(String name) {
    return countries
        .firstWhereOrNull((element) => element.name.equalsIgnoreCase(name));
  }

  List<Country>? queryCountriesByName(String name) {
    try {
      return countries
          .where((element) => element.name.containsIgnoreCase(name))
          .toList();
    } catch (e) {
      return null;
    }
  }

  List<Country>? queryCountriesByAlpha2(String alpha2) {
    try {
      return countries
          .where((element) => element.alpha2.containsIgnoreCase(alpha2))
          .toList();
    } catch (e) {
      return null;
    }
  }

  List<Country> filterItems(String query) {
    return queryCountriesByName(query)
        .let((self) => (self == null || self.isEmpty)
            ? queryCountriesByAlpha2(query)
            : self)
        .let((self) => self ?? []);
  }

  @override
  List<Object?> get props => [countries];

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      countries:
          (json['countries'] as List).map((e) => Country.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countries': countries.map((e) => e.toJson()).toList(),
    };
  }
}

class Country {
  num? id;
  String? name;
  String? alpha2;
  String? alpha3;
  String? dialCode;

  Country({
    this.id,
    this.name,
    this.alpha2,
    this.alpha3,
    this.dialCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      alpha2: json['alpha2'],
      alpha3: json['alpha3'],
      dialCode: json['dialCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alpha2': alpha2,
      'alpha3': alpha3,
      'dialCode': dialCode,
    };
  }

  bool isSameCountry(Country country) {
    return alpha2.equalsIgnoreCase(country.alpha2);
  }
}
