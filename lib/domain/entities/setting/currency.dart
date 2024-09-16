import 'package:brain_box_ai/core/utility/compare_string.dart';
import 'package:brain_box_ai/core/utility/scope_function.dart';
import 'package:collection/collection.dart';

import '../base_entity.dart';
import '../user_session.dart';

class Currencies extends BaseEntity {
  final List<Currency> currencies;

  Currencies({
    required this.currencies,
  });

  Currency? getCurrencyByCode(String code) {
    return currencies
        .firstWhereOrNull((element) => element.code.equalsIgnoreCase(code));
  }

  Currency? getCurrencyById(int id) {
    return currencies.firstWhereOrNull((element) => element.id == id);
  }

  Currency? getCurrencyByName(String name) {
    return currencies
        .firstWhereOrNull((element) => element.name.equalsIgnoreCase(name));
  }

  List<Currency>? queryCurrenciesByName(String name) {
    try {
      return currencies
          .where((element) => element.name.containsIgnoreCase(name))
          .toList();
    } catch (e) {
      return null;
    }
  }

  List<Currency>? queryCurrenciesByCode(String code) {
    try {
      return currencies
          .where((element) => element.code.containsIgnoreCase(code))
          .toList();
    } catch (e) {
      return null;
    }
  }

  List<Currency> filterItems(String query) {
    return queryCurrenciesByName(query)
        .let((it) =>
            (it == null || it.isEmpty) ? queryCurrenciesByCode(query) : it)
        .let((it) => it ?? []);
  }

  factory Currencies.fromJson(Map<String, dynamic> json) {
    return Currencies(
      currencies: (json['currencies'] as List)
          .map((e) => Currency.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencies': currencies.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [currencies];
}

class Currency {
  final int? id;
  final String? name;
  final String? code;
  final String? symbol;
  final int? exchange;
  final String? position;
  final String? thousandSeparator;
  final String? decimalSeparator;
  final int? currencyDecimal;
  final int? priceRangeMin;
  final int? priceRangeMax;
  final int? priority;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Currency({
    this.id,
    this.name,
    this.code,
    this.symbol,
    this.exchange,
    this.position,
    this.thousandSeparator,
    this.decimalSeparator,
    this.currencyDecimal,
    this.priceRangeMin,
    this.priceRangeMax,
    this.priority,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      code: json['unit'],
      symbol: json['symbol'],
      exchange: json['exchange'],
      position: json['position'],
      thousandSeparator: json['thousand_separator'],
      decimalSeparator: json['decimal_separator'],
      currencyDecimal: json['currency_decimal'],
      priceRangeMin: json['price_range_min'],
      priceRangeMax: json['price_range_max'],
      priority: json['priority'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'unit': code,
      'symbol': symbol,
      'exchange': exchange,
      'position': position,
      'thousand_separator': thousandSeparator,
      'decimal_separator': decimalSeparator,
      'currency_decimal': currencyDecimal,
      'price_range_min': priceRangeMin,
      'price_range_max': priceRangeMax,
      'priority': priority,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  bool isSameCurrency(Currency currency) {
    return id == currency.id;
  }
}
