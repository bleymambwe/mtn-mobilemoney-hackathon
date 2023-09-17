import 'package:flutter/material.dart';
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
  bool isSendPressed = false;
  bool isReceivePressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSendPressed = true;
                  isReceivePressed = false;
                });
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
                setState(() {
                  isSendPressed = false;
                  isReceivePressed = true;
                });
              },
              child: NeumorphicContainer(
                height: double.infinity,
                width: double.infinity,
                backgroundColor: isReceivePressed
                    ? Colors.amber
                    : mainColor, // Adjust colors
                depth: isReceivePressed ? 10 : 1.0, // Adjust depth
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
    );
  }
}

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;
  final double depth;

  NeumorphicContainer({
    required this.child,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.amber,
    this.borderRadius = 12.0,
    this.depth = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -depth,
            blurRadius: depth,
            offset: Offset(-depth, -depth),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: -depth,
            blurRadius: depth,
            offset: Offset(depth, depth),
          ),
        ],
      ),
      child: child,
    );
  }
}
