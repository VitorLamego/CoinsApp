// ignore_for_file: prefer_const_constructors

import 'package:coins_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:coins_app/core/core.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool exchangeCoin = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.23,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            GlobalVariables.customColors["primaryBlue"]!,
            GlobalVariables.customColors["ligthBlue"]!
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Olá, ",
                style: TextStyle(
                  fontSize: 22,
                  color: GlobalVariables.customColors["customWhite"],
                ),
                children: const [
                  TextSpan(
                      text: "Investidor!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "AnekMalayalam-Bold")),
                ],
              ),
            ),
            Switch(
              value: exchangeCoin,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red,
              activeThumbImage: ResizeImage(
                AssetImage("images/brasilCoin.png"),
                width: 35,
                height: 35,
              ),
              inactiveThumbImage: ResizeImage(
                AssetImage("images/estadosUnidosCoin.png"),
                width: 35,
                height: 35,
              ),
              onChanged: (value) {
                setState(() {
                  exchangeCoin = value;
                  widget.controller.isDolarSelected.value = !value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
