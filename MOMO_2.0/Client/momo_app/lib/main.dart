import 'package:flutter/material.dart';
import 'theme.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'mainScreen/app_bar.dart';
import 'mainScreen/name_and_profile.dart';
import 'mainScreen/send_and_receive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primaryColor: mainColor,

      //   ),

      home: Scaffold(
        backgroundColor: mainColor, //mainColor,
        body: SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            minimum: const EdgeInsets.all(8.0),
            child: Home()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        // alignment: Alignement.cent,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAppBar(),
              SizedBox(
                height: 15,
              ),
              NameAndProfile(),
              SizedBox(
                height: 15,
              ),
              SendAndReceive(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAIWidget(),
          )
        ],
      ),
    );
  }
}

class BottomAIWidget extends StatelessWidget {
  const BottomAIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 65,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/icons/lines_black.json',
                  width: 55,
                  height: 55,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MoMo AI',
                  style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      color: Colors.amber),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 1,
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
