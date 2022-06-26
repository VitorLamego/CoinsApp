import 'dart:convert';

Criptomoeda userFromJson(String str) => Criptomoeda.fromJson(json.decode(str));

class Criptomoeda {
  String name;
  String cotation;
  String symbol;
  String imageUrl;
  String infoAbout;
  double fee;

  Criptomoeda(
      {required this.name,
      required this.cotation,
      required this.symbol,
      required this.imageUrl,
      required this.infoAbout,
      required this.fee});

  factory Criptomoeda.fromJson(Map<String, dynamic> json) => Criptomoeda(
      name: json["currency_name"],
      cotation: json["cotation"],
      symbol: json["symbol"],
      imageUrl: json["image_url"],
      infoAbout: json["details"]["about"],
      fee: json["details"]["fee"]);
}
