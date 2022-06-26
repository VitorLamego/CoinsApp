import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String walletId;
  String balance;

  User({required this.walletId, required this.balance});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(walletId: json["wallet_id"], balance: json["user_balance"]);
}
