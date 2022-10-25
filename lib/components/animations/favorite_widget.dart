import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool checked = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(microseconds: 500);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  test() {
    (!checked) ? _controller.forward() : _controller.reverse();
    checked = !checked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: test(),
        child: SizedBox(
          width: 200,
          child: Lottie.asset(
            "lottie/favorite.json",
          ),
        ),
      ),
    );
  }
}
