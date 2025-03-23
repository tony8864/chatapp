import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ChatLogo extends StatelessWidget {
  final double size;

  const ChatLogo({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.chat_bubble, color: Colors.white, size: size * 0.6),
            Positioned(
              bottom: size * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Dot(),
                  SizedBox(width: size * 0.05),
                  _Dot(),
                  SizedBox(width: size * 0.05),
                  _Dot(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 63, 16, 16),
        shape: BoxShape.circle,
      ),
    );
  }
}
