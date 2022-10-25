// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:empregabildade/components/animations/profile_searching_widget.dart';
import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  PictureWidget({
    super.key,
    required this.future,
    this.width,
    this.height,
  });

  Future<Uint8List?>? future;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: future,
      builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(snapshot.data!, scale: 0.5)),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
            );
          }
        }
        return Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: height,
            width: width,
            child: const ProfileSearchingWidget(),
          ),
        );
      },
    );
  }
}
