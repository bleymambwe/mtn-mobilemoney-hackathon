import 'package:flutter/material.dart';
import 'theme.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'mainScreen/app_bar.dart';
import 'mainScreen/name_and_profile.dart';
import 'mainScreen/send_and_receive.dart';
import 'mainScreen/send_via_qr.dart';

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

class BottomAIWidget extends StatefulWidget {
  //init
  const BottomAIWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomAIWidget> createState() => _BottomAIWidgetState();
}

class _BottomAIWidgetState extends State<BottomAIWidget> {
  bool isClosed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: isClosed ? Radius.circular(20) : Radius.circular(8),
            topRight: isClosed ? Radius.circular(20) : Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      width: isClosed
          ? MediaQuery.of(context).size.width * 0.8
          : MediaQuery.of(context).size.width,
      height: isClosed ? 66 : MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isClosed = !isClosed;
                });
              },
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lottie.asset(
                    //   'assets/icons/line_box.json',
                    //   width: 55,
                    //   height: 55,
                    //   fit: BoxFit.fill,
                    // ),
                    const Text(
                      'MoMo AI ',
                      style: TextStyle(
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Colors.amber),
                    ),
                    Icon(
                      isClosed
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ),
          ),
          //Chatbox
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: isClosed
                    ? MediaQuery.of(context).size.width * 0.8
                    : double.infinity,
                height:
                    isClosed ? 0 : MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: Colors.amber)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
