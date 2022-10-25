import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "lottie/info.json",
      ),
    );
  }
}
