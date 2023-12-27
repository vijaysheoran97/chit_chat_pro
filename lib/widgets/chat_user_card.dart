import 'package:chit_chat_pro/main.dart';
import 'package:chit_chat_pro/models/chat_user.dart';
import 'package:chit_chat_pro/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      // color: Colors.blue.shade100,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user)));
        },
        child: ListTile(
            //user profile picture
            // leading: const CircleAvatar(child: Icon(CupertinoIcons.person),),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * .3),
              child: CachedNetworkImage(
                // width: mq.height * 0.55,
                // height: mq.height * 0.55,
                imageUrl: widget.user.image,
                errorWidget: (context, url, error) => const CircleAvatar(
                  child: Icon(CupertinoIcons.person),
                ),
              ),
            ),

            //user name
            title: Text(widget.user.name),

            //last message
            subtitle: Text(widget.user.about, maxLines: 1),

            //last message time
            trailing: Container(
              width: 14,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            )
            // trailing: Text(
            //   '12:00 PM',
            //   style: TextStyle(color: Colors.black54),
            // ),
            ),
      ),
    );
  }
}
