// ignore_for_file: prefer_const_constructors

import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeMyAccount extends StatefulWidget {
  const HomeMyAccount({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<HomeMyAccount> createState() => _HomeMyAccountState();
}

class _HomeMyAccountState extends State<HomeMyAccount> {
  bool viewBalance = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        constraints: BoxConstraints.expand(height: size.height * 0.15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Meu saldo:",
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      viewBalance = !viewBalance;
                    });
                  },
                  icon: viewBalance
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  padding: const EdgeInsets.all(0),
                  constraints: BoxConstraints(minWidth: size.width * 0.1),
                  iconSize: 20,
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: widget.controller.isDolarSelected,
                builder: (BuildContext context, bool isDolarSelected,
                    Widget? child) {
                  return FutureBuilder(
                    future: widget.controller.setUserData(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          viewBalance) {
                        return Text(
                          widget.controller.convertCoinToUSDT(
                              (snapshot.data as User).balance),
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "AnekMalayalam-Bold",
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }
                      return SizedBox(
                        width: 100,
                        height: 30.0,
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFFEBEBF4),
                          highlightColor: Color(0xFFF4F4F4),
                          child: Container(
                            color: Colors.grey.shade200,
                            height: 30,
                            width: 100,
                          ),
                        ),
                      );
                    }),
                  );
                }),
            FutureBuilder(
              future: widget.controller.setUserData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    viewBalance) {
                  return Text(
                    "ContaID: " + (snapshot.data as User).walletId,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  );
                }
                return SizedBox(
                  width: 200,
                  height: 10,
                  child: Shimmer.fromColors(
                    baseColor: Color(0xFFEBEBF4),
                    highlightColor: Color(0xFFF4F4F4),
                    child: Container(
                      color: Colors.grey.shade200,
                      height: 20,
                      width: 200,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
