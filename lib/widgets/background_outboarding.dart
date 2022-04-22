import 'package:flutter/material.dart';

class BackgroundOutboarding extends StatelessWidget {
  final Widget child;
  const BackgroundOutboarding({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
            0.1,
            0.2,
            0.5,
          ],
              colors: [
            Color.fromRGBO(176, 41, 136, 1),
            Color.fromRGBO(147, 35, 136, 1),
            Color.fromRGBO(82, 26, 136, 1),
          ])),
      child: child,
    );
  }
}
