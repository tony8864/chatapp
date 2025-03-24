import 'package:chatapp/features/chats/widgets/chat_input.dart';
import 'package:chatapp/features/chats/widgets/conversation_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationScreen extends StatefulWidget {
  final String userName;
  final String userInitial;
  final List<Map<String, String>> messages;

  const ConversationScreen({
    super.key,
    required this.userName,
    required this.userInitial,
    required this.messages,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            _ChatAppBar(
              onBack: () {
                Navigator.pop(context);
              },
              userName: widget.userName,
            ),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            Expanded(child: ConversationList(messages: widget.messages)),
            ChatInput(controller: _messageController),
          ],
        ),
      ),
    );
  }
}

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback onBack;

  const _ChatAppBar({required this.userName, required this.onBack});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: preferredSize.height,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          children: [
            IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back, size: 32),
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            Text(
              userName,
              style: GoogleFonts.merriweatherSans(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
