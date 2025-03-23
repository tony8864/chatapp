import 'package:chatapp/routes/app_navigator.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final bool hasUnread;

  const ChatTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.hasUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(name[0], style: TextStyle(color: Colors.white)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black87),
            ),
          ),
          if (hasUnread)
            Container(
              margin: EdgeInsets.only(left: 8),
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
        ],
      ),
      onTap: () {
        AppNavigator.push('/home/chats/test');
      },
    );
  }
}
