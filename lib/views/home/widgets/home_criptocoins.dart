// ignore_for_file: prefer_const_constructors

import 'package:coins_app/controller/home_controller.dart';
import 'package:coins_app/models/criptomoedas.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCryptoCoins extends StatefulWidget {
  const HomeCryptoCoins(
      {Key? key, required this.cryptoInfo, required this.controller})
      : super(key: key);

  final Criptomoeda cryptoInfo;
  final HomeController controller;

  @override
  State<HomeCryptoCoins> createState() => _HomeCryptoCoinsState();
}

class _HomeCryptoCoinsState extends State<HomeCryptoCoins> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
        valueListenable: widget.controller.isDolarSelected,
        builder: (BuildContext context, bool isDolarSelected, Widget? child) {
          return Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.15))
              ],
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Hero(
                        tag: widget.cryptoInfo.symbol,
                        child: Image.network(
                          widget.cryptoInfo.imageUrl,
                          loadingBuilder: (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return SizedBox(
                              width: 40,
                              height: 40.0,
                              child: Shimmer.fromColors(
                                baseColor: Color(0xFFEBEBF4),
                                highlightColor: Color(0xFFF4F4F4),
                                child: Container(
                                  color: Color(0xFFFFFFFF),
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            );
                          },
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: SizedBox(
                      width: size.width * 0.18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            widget.cryptoInfo.symbol,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            widget.cryptoInfo.name,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Icon(
                      Icons.auto_graph,
                      color: Colors.green,
                    ),
                  ),
                  isDolarSelected
                      ? Text(
                          "U\$ ${widget.controller.convertCoinToUSDT(widget.cryptoInfo.cotation)}")
                      : Text(widget.controller
                          .convertCoinToUSDT(widget.cryptoInfo.cotation))
                ],
              ),
            ),
          );
        });
  }
}
