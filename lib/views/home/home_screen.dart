// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/services/home_service.dart';
import 'package:coins_app/views/home/widgets/home_app_bar.dart';
import 'package:coins_app/views/home/widgets/home_my_account.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();
  final HomeService service = HomeService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Stack(
              children: [
                HomeAppBar(controller: controller),
                HomeMyAccount(
                  controller: controller,
                  service: service,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 20, 0, 10),
              child: Text(
                "Criptomoedas:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
          FutureBuilder(
            future: service.buildCryptoList(controller),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      children: [...snapshot.data as List],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
