import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeController {
  ValueNotifier<bool> isDolarSelected = ValueNotifier(false);

  String convertCoinToUSDT(String value) {
    double usdtConvert = 5.24;

    final regularExp = RegExp(r'[.](?=[0-9]{3})');

    String brasilValue = value.replaceAllMapped(regularExp, (match) => "");

    if (isDolarSelected.value) {
      return formatValue((double.parse(brasilValue) / usdtConvert));
    }

    return formatValue(double.parse(brasilValue));
  }

  String convertFeeToUSDT(double value) {
    double usdtConvert = 5.24;

    if (isDolarSelected.value) {
      return formatValue((value / usdtConvert));
    }

    return formatValue(value);
  }

  String formatValue(double price) {
    final usCurrency = NumberFormat.simpleCurrency(locale: "en_US");
    final ptCurrency = NumberFormat.simpleCurrency(locale: "pt_BR");

    if (isDolarSelected.value) return usCurrency.format(price);

    return ptCurrency.format(price);
  }
}
