import 'package:chit_chat_pro/api/api.dart';
import 'package:chit_chat_pro/main.dart';
import 'package:chit_chat_pro/models/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.fromId
        ? _greenMessage()
        : _blueMessage();
  }

  Widget _blueMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(mq.width * .04),
          margin: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .01),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border: Border.all(color: Colors.lightBlue),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Text(
            widget.message.msg,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        Text(
          widget.message.sent,
          style: const TextStyle(fontSize: 13,color: Colors.black54),
        )
      ],
    );
  }

  Widget _greenMessage() {
    return Container();
  }
}
