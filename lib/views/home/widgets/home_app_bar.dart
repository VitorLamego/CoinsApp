import 'package:flutter/material.dart';
import 'package:coins_app/core/core.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

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
            )
          ],
        ),
      ),
    );
  }
}
