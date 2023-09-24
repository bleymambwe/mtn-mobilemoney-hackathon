import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'mainScreen/app_bar.dart';
import 'mainScreen/name_and_profile.dart';
import 'mainScreen/send_and_receive.dart';
import 'mainScreen/send_via_qr.dart';
import 'mainScreen/bottomAIWidget.dart';

import 'providerLogic/provider_logic.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SendReceiveProvider(),
      child: MyApp(),
    ),
  );
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              SizedBox(
                height: 15,
              ),
              SendViaQR(),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: BottomAIWidget())
        ],
      ),
    );
  }
}
