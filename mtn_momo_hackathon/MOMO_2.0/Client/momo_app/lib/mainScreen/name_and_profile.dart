import 'package:flutter/material.dart';
import 'package:momo_app/theme.dart';

class NameAndProfile extends StatelessWidget {
  const NameAndProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/profile/man_profile.jpg',
                height: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: mainFont, // Use the font family name
                  fontWeight: mediumFont,
                ),
              ),
              Text(
                'Mulenga',
                style: TextStyle(
                  fontSize: secondaryFontSize,
                  fontFamily: mainFont,
                  fontWeight: boldFont,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
