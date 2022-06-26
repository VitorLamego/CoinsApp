import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/models/user.dart';
import 'package:flutter/material.dart';

class HomeMyAccount extends StatefulWidget {
  const HomeMyAccount({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<HomeMyAccount> createState() => _HomeMyAccountState();
}

class _HomeMyAccountState extends State<HomeMyAccount> {
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
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                ),
              ],
            ),
            FutureBuilder(
              future: widget.controller.setUserData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    "R\$" + (snapshot.data as User).balance.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "AnekMalayalam-Bold",
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }
                return Center(
                  child: Text(""),
                );
              }),
            ),
            FutureBuilder(
              future: widget.controller.setUserData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    "ContaID: " + (snapshot.data as User).walletId,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  );
                }
                return Center(
                  child: Text(""),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
