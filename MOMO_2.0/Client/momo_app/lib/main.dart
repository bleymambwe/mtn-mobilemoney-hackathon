import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: mainColor),
      home: const Scaffold(
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
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [CustomAppBar()],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CircularContainerWithSVG()],
    );
  }
}

class CircularContainerWithSVG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set the desired width
      height: 150, // Set the desired height
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue, // Change the color to your desired background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding as needed
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/menu_icon.svg', // Replace with the path to your SVG file
            width: 100, // Adjust the width of the SVG as needed
            height: 100, // Adjust the height of the SVG as needed
          ),
        ),
      ),
    );
  }
}
