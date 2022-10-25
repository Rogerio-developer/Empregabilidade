import 'package:flutter/material.dart';

class SafeArea21 extends StatelessWidget {
  final String? titulo;
  final Widget? body;
  final bool? drawer;
  final double? iconSize;
  final Widget? icon;
  final Widget? page;

  const SafeArea21({
    super.key,
    this.titulo,
    this.body,
    this.drawer,
    this.icon,
    this.page,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: (drawer == false || drawer == null) ? null : const Drawer(),
        appBar: titulo == null
            ? null
            : AppBar(
                actions: (icon == null)
                    ? []
                    : [
                        IconButton(
                          iconSize: iconSize,
                          onPressed: () {
                            if (page != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => page!,
                                ),
                              );
                            }
                          },
                          icon: icon!,
                        ),
                      ],
                centerTitle: true,
                backgroundColor: const Color.fromRGBO(59, 57, 138, 1),
                title: titulo != null
                    ? Text(
                        titulo!,
                        style: const TextStyle(color: Colors.white),
                      )
                    : null),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.4, 0.6, 0.8],
              colors: [
                Color.fromRGBO(59, 57, 138, 1),
                Color.fromRGBO(14, 152, 238, 1),
                Color.fromRGBO(46, 73, 205, 1),
                Color.fromRGBO(37, 155, 143, 1),
              ],
            ),
          ),
          child: body == null ? const Center() : body!,
        ),
      ),
    );
  }
}
