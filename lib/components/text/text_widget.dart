import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTituloWidget extends StatelessWidget {
  final String text;
  final double? size;

  const TextTituloWidget({
    super.key,
    required this.text,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      style: GoogleFonts.arsenal(
        color: Colors.white,
        fontSize: (size != null) ? size : 30,
      ),
    );
  }
}
