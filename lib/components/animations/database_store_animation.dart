import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DatabaseStoreAnimation extends StatelessWidget {
  const DatabaseStoreAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "lottie/database_store.json",
      ),
    );
  }
}
