import 'package:flutter/material.dart';
import 'package:momo_app/theme.dart';

class BottomAIWidget extends StatefulWidget {
  //init
  const BottomAIWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomAIWidget> createState() => _BottomAIWidgetState();
}

class _BottomAIWidgetState extends State<BottomAIWidget> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: isOpen ? Radius.circular(20) : Radius.circular(8),
            topRight: isOpen ? Radius.circular(20) : Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      width: isOpen
          ? MediaQuery.of(context).size.width * 0.8
          : MediaQuery.of(context).size.width,
      height: isOpen ? 66 : MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
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
                      isOpen
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
                width: isOpen
                    ? MediaQuery.of(context).size.width * 0.8
                    : double.infinity,
                height: isOpen ? 0 : MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: Colors.amber)),
                child: Visibility(
                    visible: isOpen == false,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0, // Position at the bottom
                            left: 0, // Position at the center horizontally
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextBox(),
                            ))
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap here (e.g., to focus on the text field)
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius:
              BorderRadius.circular(8), // Optional: Add rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove default border
                    hintText:
                        'How can I assist...', // Optional placeholder text
                    hintStyle: TextStyle(color: Colors.grey),
                    // Optional hint text style
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle clear icon tap here (e.g., to clear text)
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Handle send icon tap here (e.g., to send the message)
                },
                child: Icon(
                  Icons.send,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
