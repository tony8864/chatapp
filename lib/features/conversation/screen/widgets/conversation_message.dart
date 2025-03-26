import 'package:chatapp/features/conversation/model/message.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationMessage extends StatelessWidget {
  final Message message;

  const ConversationMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.senderId == (FirebaseAuth.instance.currentUser?.uid)!;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : const Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.content,
          style: GoogleFonts.merriweatherSans(
            fontSize: 14,
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
