import 'dart:convert';

import 'package:coins_app/models/criptomoedas.dart';
import 'package:coins_app/models/user.dart';
import 'package:coins_app/views/home/widgets/home_criptocoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomeController {
  ValueNotifier<bool> isDolarSelected = ValueNotifier(false);

  Future<List<Widget>> buildCryptoList() async {
    String cryptoData = await rootBundle.loadString("criptomoedas.json");

    var myData = json.decode(cryptoData);

    List cryptos = myData["data"];
    List<Widget> cryptoList = [];

    for (var element in cryptos) {
      Criptomoeda crypto = Criptomoeda.fromJson(element);
      cryptoList.add(HomeCryptoCoins(
        cryptoInfo: crypto,
        controller: this,
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

  String convertCoinToUSDT(String value) {
    double usdtConvert = 5.24;

    final regularExp = RegExp(r'[.](?=[0-9]{3})');

    String brasilValue = value.replaceAllMapped(regularExp, (match) => "");

    if (isDolarSelected.value) {
      return formatValue((double.parse(brasilValue) / usdtConvert));
    }

    return formatValue(double.parse(brasilValue));
  }

  String formatValue(double price) {
    final usCurrency = NumberFormat.simpleCurrency(locale: "en_US");
    final ptCurrency = NumberFormat.simpleCurrency(locale: "pt_BR");

    if (isDolarSelected.value) return usCurrency.format(price);

    return ptCurrency.format(price);
  }
}
