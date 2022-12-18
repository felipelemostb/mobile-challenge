import 'dart:convert';

class CurrencyInfoModel {
  String symbol;
  String name;
  String symbolNative;
  int decimalDigits;
  int rounding;
  String code;
  String namePlural;

  CurrencyInfoModel({
    required this.symbol,
    required this.name,
    required this.symbolNative,
    required this.decimalDigits,
    required this.rounding,
    required this.code,
    required this.namePlural,
  });

  Map<String, dynamic> toMap() {
    return {
      "symbol": symbol,
      "name": name,
      "symbol_native": symbolNative,
      "decimal_digits": decimalDigits,
      "rounding": rounding,
      "code": code,
      "name_plural": namePlural
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CurrencyInfoModel.fromMap(Map<String, dynamic> map) {
    return CurrencyInfoModel(
      symbol: map["symbol"] ?? "",
      name: map["name"] ?? "",
      symbolNative: map["symbol_native"] ?? "",
      decimalDigits: map["decimal_digits"] ?? 0,
      rounding: map["rounding"] ?? 0,
      code: map["code"] ?? "",
      namePlural: map["name_plural"] ?? "",
    );
  }

  factory CurrencyInfoModel.fromJson(String json) =>
      CurrencyInfoModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'CurrencyInfo(symbol: $symbol, name: $name, symbolNative: $symbolNative, decimalDigits: $decimalDigits, rounding: $rounding, code: $code, namePlural: $namePlural)';
  }
}
