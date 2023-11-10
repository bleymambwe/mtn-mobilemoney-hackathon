import 'package:flutter/material.dart';
import 'package:momo_app/providerLogic/send_receive_logic.dart';
import 'package:momo_app/providerLogic/text_box_logic.dart';
import 'package:provider/provider.dart';

import 'package:momo_app/theme.dart';

class SendAndReceive extends StatelessWidget {
  const SendAndReceive({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SendOrReceive()],
    );
  }
}

class SendOrReceive extends StatefulWidget {
  SendOrReceive({Key? key});

  @override
  _SendOrReceiveState createState() => _SendOrReceiveState();
}

class _SendOrReceiveState extends State<SendOrReceive> {
  @override
  Widget build(BuildContext context) {
    final sendReceiveProvider = Provider.of<SendReceiveProvider>(context);

    bool isSendPressed = sendReceiveProvider.isSendPressed;
    bool isReceivePressed = sendReceiveProvider.isReceivePressed;

    return Consumer<SendReceiveProvider>(
      builder: (context, sendReceiveProvider, child) => Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  if (!isSendPressed) {
                    sendReceiveProvider.setSendPressed(true);
                    sendReceiveProvider.setReceivePressed(false);
                  }
                },
                child: NeumorphicContainer(
                  height: double.infinity,
                  width: double.infinity,
                  backgroundColor:
                      isSendPressed ? Colors.amber : mainColor, // Adjust colors
                  depth: isSendPressed ? 10.0 : 1.0, // Adjust depth
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                        fontFamily: mainFont,
                        fontWeight: isSendPressed
                            ? FontWeight.w500
                            : mediumFont, // Adjust fontWeight
                        fontSize: 25,
                        color: isSendPressed
                            ? Colors.black
                            : Colors.amber, // Adjust text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  if (!isReceivePressed) {
                    sendReceiveProvider.setSendPressed(false);
                    sendReceiveProvider.setReceivePressed(true);
                  }
                },
                child: NeumorphicContainer(
                  height: double.infinity,
                  width: double.infinity,
                  backgroundColor: isReceivePressed
                      ? Colors.amber
                      : mainColor, // Adjust colors
                  depth: isReceivePressed ? 10.0 : 1.0, // Adjust depth
                  child: Center(
                    child: Text(
                      'Receive',
                      style: TextStyle(
                        fontFamily: mainFont,
                        fontWeight: isReceivePressed
                            ? FontWeight.w500
                            : mediumFont, // Adjust fontWeight
                        fontSize: 25,
                        color: isReceivePressed
                            ? Colors.black
                            : Colors.amber, // Adjust text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
