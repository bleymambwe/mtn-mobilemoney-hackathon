import 'package:flutter/material.dart';
import 'package:momo_app/theme.dart';

import 'package:momo_app/providerLogic/text_box_logic.dart';
import 'package:provider/provider.dart';

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
    // final msgProvider = Provider.of<TextBoxProvider>(context);
    //final MessageBoxProvider messageBoxProvider = MessageBoxProvider();

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
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      child: Icon(
                        isOpen
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Container(
                              color: Colors.black45,
                              child: Consumer<MessageBoxProvider>(
                                builder: (context, provider, child) {
                                  final sentMsgs = provider.sentMsgs;
                                  final receivedMsgs = provider.receivedMsgs;

                                  return CustomMsgBox(
                                    sentMessages: sentMsgs,
                                    receivedMessages: receivedMsgs,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0, // Position at the bottom
                          left: 0, // Position at the center horizontally
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextBox(),
                          ),
                        )
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

class CustomMsgBox extends StatelessWidget {
  final List<String> sentMessages;
  final List<String> receivedMessages;

  CustomMsgBox({
    required this.sentMessages,
    required this.receivedMessages,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> interleavedMessages =
        _interleaveMessages(sentMessages, receivedMessages);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      //reverse: true,
      itemCount: interleavedMessages.length,
      itemBuilder: (context, index) {
        final message = interleavedMessages[index];
        final isSent = (index % 2 == 0); // Check if the message is sent

        return _buildMessage(message, isSent);
      },
    );
  }

  Widget _buildMessage(String message, bool isSent) {
    final alignment = isSent ? Alignment.centerLeft : Alignment.centerRight;
    final backgroundColor =
        isSent ? Colors.amber.shade100 : Colors.amber.shade300;
    final textColor = isSent ? Colors.grey : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: alignment,
        child:
            Consumer<MessageBoxProvider>(builder: (context, provider, child) {
          final awaitingMsg = provider.awaitingMsg;

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(-3, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: awaitingMsg
                ? Text(
                    message,
                    style: TextStyle(
                      fontFamily:
                          mainFont, // Replace with your desired font family
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  )
                : const CircularProgressIndicator(
                    backgroundColor: Colors.amber,
                    valueColor: AlwaysStoppedAnimation(Colors.black87),
                  ),
          );
        }),
      ),
    );
  }

  List<String> _interleaveMessages(List<String> sent, List<String> received) {
    List<String> interleaved = [];

    final int sentLength = sent.length;
    final int receivedLength = received.length;
    final int maxLength =
        sentLength > receivedLength ? sentLength : receivedLength;

    for (int i = 0; i < maxLength; i++) {
      if (i < sentLength) {
        interleaved.add(sent[i]);
      }
      if (i < receivedLength) {
        interleaved.add(received[i]);
      }
    }
    return interleaved;
  }
}

class CustomTextBox extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                //readOnly: false,
                //textInputAction: TextInputAction.none,
                enableInteractiveSelection: false,
                style: const TextStyle(
                  fontFamily: mainFont,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none, // Remove default border
                  hintText: 'How can I assist...',
                  // Optional placeholder text
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: mainFont,
                    fontWeight: FontWeight.w500,
                  ),
                  // Optional hint text style
                ),
              ),
            ),
            GestureDetector(
              //Clear Icon
              onTap: () {
                // Handle clear icon tap here (e.g., to clear text)
                textController.clear();
              },
              child: const Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              //Send Icon
              onTap: () {
                // Handle send icon tap here (e.g., to send the message)
                String text = textController.text;
                MessageBoxProvider send_messageBoxProvider =
                    Provider.of<MessageBoxProvider>(context, listen: false);
                send_messageBoxProvider.sendMsg(text);
                textController.clear();
                //msgProvider.SendMsg(text);
              },
              child: const Icon(
                Icons.send,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
