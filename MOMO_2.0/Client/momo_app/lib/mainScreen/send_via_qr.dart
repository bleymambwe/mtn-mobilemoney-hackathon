import 'package:flutter/material.dart';
import 'package:momo_app/providerLogic/provider_logic.dart';
import 'package:momo_app/theme.dart';
import 'package:provider/provider.dart';

class SendViaQR extends StatelessWidget {
  const SendViaQR({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = getScreenWidth(context);
    double screenHeight = getScreenHeight(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeumorphicContainer(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.35,
                    child: QR_NFC_Widget(
                      method: 'QR',
                      imageLink: 'assets/send_via_qr_nft/scanning-qr-code.png',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeumorphicContainer(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.35,
                    child: QR_NFC_Widget(
                      method: 'NFC',
                      imageLink: 'assets/send_via_qr_nft/nfc-payments-logo.png',
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class QR_NFC_Widget extends StatelessWidget {
  const QR_NFC_Widget(
      {Key? key, // Corrected the parameter name and added the type 'Key'
      required this.imageLink,
      required this.method // Removed the semicolon and added 'required' keyword
      })
      : super(key: key); // Corrected the constructor

  final String imageLink;
  final String method;

  @override
  Widget build(BuildContext context) {
    final sendReceiveProvider = Provider.of<SendReceiveProvider>(context);
    bool isSendPressed = sendReceiveProvider.isSendPressed;
    bool isReceivePressed = sendReceiveProvider.isReceivePressed;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<SendReceiveProvider>(
          builder: (context, SendReceiveProvider, child) => Text(
            isSendPressed ? ' Send via' : 'Receive via',
            style: TextStyle(
              fontSize: 20,
              fontFamily: mainFont, // Use the font family name
              fontWeight: mediumFont,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              method,
              style: TextStyle(
                fontFamily: mainFont,
                fontSize: 25,
                fontWeight: boldFont,
              ),
            ),
            Container(
              width: 70,
              height: 70,
              child: Image.asset(
                imageLink,
                fit: BoxFit.fill,
              ),
            )
          ],
        )
      ],
    );
  }
}
