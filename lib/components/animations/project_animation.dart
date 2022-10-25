import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProjectAnimation extends StatelessWidget {
  const ProjectAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "lottie/project.json",
      ),
    );
  }
}
