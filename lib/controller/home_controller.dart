import 'dart:convert';

import 'package:coins_app/models/criptomoedas.dart';
import 'package:coins_app/models/user.dart';
import 'package:coins_app/views/home/widgets/home_criptocoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeController {
  Future<List<Widget>> buildCryptoList() async {
    String cryptoData = await rootBundle.loadString("criptomoedas.json");

    var my_data = json.decode(cryptoData);

    List cryptos = my_data["data"];
    List<Widget> cryptoList = [];

    cryptos.forEach((element) {
      Criptomoeda crypto = Criptomoeda.fromJson(element);
      cryptoList.add(HomeCryptoCoins(cryptoInfo: crypto));
    });

    return cryptoList;
  }

  Future<User> setUserData() async {
    String cryptoData = await rootBundle.loadString("criptomoedas.json");

    var my_data = json.decode(cryptoData);

    return User(
        walletId: my_data["wallet_id"],
        balance: double.parse(my_data["user_balance"]));
  }
}
