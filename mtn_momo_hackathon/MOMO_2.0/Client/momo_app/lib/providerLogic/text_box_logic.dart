import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageBoxProvider extends ChangeNotifier {
  late List<String> sentMsgs;
  late List<String> receivedMsgs;
  bool awaitingMsg = true;

  MessageBoxProvider() {
    sentMsgs = [];
    receivedMsgs = [];
  }

  void sendMsg(String msg) async {
    // const String url = 'http://localhost';
    sentMsgs.add(msg);
//add virtual machine public IP instead otherwise for localhost 10.0.2.2:8000
    final url = Uri.http('10.0.2.2:8000', '/process_input/');

    final data = {'message': msg};
    final jsonBody = jsonEncode(data);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      //print('Message sent successfully');
      final responseData = jsonDecode(response.body);

      // Access the 'message' key in the JSON response
      //final message = responseData['message'];
      final message = responseData.toString();
      print('Response body: ${message}');

      receiveMsg(message);
    } else {
      print('Failed to send message. Status code: ${response.statusCode}');
      receiveMsg('sorry I think something is wrong with our servers atm');
      print('Response body: ${response.body}');
    }
    notifyListeners();
  }

  void receiveMsg(String msg) {
    //receive message
    Future.delayed(Duration(seconds: 1), () {
      if (receivedMsgs != null) {
        receivedMsgs.add(msg);
        notifyListeners();
      } else {
        // Handle the case where receivedMsgs is null
      }
    });
  }
}
