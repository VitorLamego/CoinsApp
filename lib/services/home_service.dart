import 'dart:convert';

import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/models/criptomoedas.dart';
import 'package:coins_app/models/user.dart';
import 'package:coins_app/views/home/widgets/home_criptocoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeService {
  Future<List<Widget>> buildCryptoList(HomeController controller) async {
    String cryptoData = await rootBundle.loadString("criptomoedas.json");

    var myData = json.decode(cryptoData);

    List cryptos = myData["data"];
    List<Widget> cryptoList = [];

    for (var element in cryptos) {
      Criptomoeda crypto = Criptomoeda.fromJson(element);
      cryptoList.add(HomeCryptoCoins(
        cryptoInfo: crypto,
        controller: controller,
      ));
    }

    return cryptoList;
  }

  Future<User> setUserData() async {
    String cryptoData = await rootBundle.loadString("criptomoedas.json");

    var myData = json.decode(cryptoData);

    // Linha de código adicionada apenas para mostrar o ShimmerEffect
    await Future.delayed(const Duration(seconds: 1));

    return User(walletId: myData["wallet_id"], balance: myData["user_balance"]);
  }
}
