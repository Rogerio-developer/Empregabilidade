import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPageAnimation extends StatelessWidget {
  const LoadingPageAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Lottie.asset(
            "lottie/loading_page.json",
          ),
        ],
      ),
    );
  }
}
