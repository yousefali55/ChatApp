import 'package:chatapp/Model/MessageModel.dart';
import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key, required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 32),
        decoration: const BoxDecoration(
        color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
        child: Text(
          message.message
        ),
      ),
    );
  }
}