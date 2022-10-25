import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileSearchingWidget extends StatelessWidget {
  const ProfileSearchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "lottie/profile_searching.json",
      ),
    );
  }
}
