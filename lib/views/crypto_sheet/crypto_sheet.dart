// ignore_for_file: prefer_const_constructors

import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/core/variables.dart';
import 'package:coins_app/models/criptomoedas.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CryptoSheet extends StatelessWidget {
  const CryptoSheet(
      {Key? key, required this.cryptoInfo, required this.controller})
      : super(key: key);

  final Criptomoeda cryptoInfo;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      width: size.width,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 35),
          padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
              border: Border.all(
                  color: GlobalVariables.customColors[cryptoInfo.symbol]!,
                  width: 5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cryptoInfo.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    cryptoInfo.symbol,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Um pouco mais sobre:",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
              Text(
                cryptoInfo.infoAbout,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text.rich(
                TextSpan(
                  text: "Cotação Atual: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                        text: controller.convertCoinToUSDT(cryptoInfo.cotation),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "AnekMalayalam-Bold")),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Taxa: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: controller.convertFeeToUSDT(cryptoInfo.fee),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "AnekMalayalam-Bold"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Hero(
              tag: cryptoInfo.symbol,
              child: Image.network(
                cryptoInfo.imageUrl,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return SizedBox(
                    width: 60,
                    height: 60.0,
                    child: Shimmer.fromColors(
                      baseColor: Color(0xFFEBEBF4),
                      highlightColor: Color(0xFFF4F4F4),
                      child: Container(
                        color: Color(0xFFFFFFFF),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  );
                },
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
