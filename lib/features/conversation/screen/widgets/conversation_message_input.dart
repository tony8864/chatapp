import 'package:chatapp/features/conversation/bloc/message_bloc.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationMessageInput extends StatelessWidget {
  final TextEditingController controller;
  final String chatId;

  const ConversationMessageInput({super.key, required this.controller, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: const Color.fromARGB(255, 200, 200, 200)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send, color: AppColors.primary),
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) return;
                context.read<MessageBloc>().add(SendMessageEvent(chatId: chatId, content: text));
                controller.clear();
              },
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
