import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SadEmojiAnimation extends StatelessWidget {
  const SadEmojiAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "lottie/sad_emoji.json",
      ),
    );
  }
}
