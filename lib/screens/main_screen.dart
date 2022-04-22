import 'package:flutter/material.dart';
import 'package:linio_app/screens/screens.dart';

import '../widgets/cyber_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        PageView(
          children: [
            HomeScreen(),
            ProductScreen(),
            CheckOutScreen(),
            OnboardignScreen(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width,
            child: CyberMenu(),
          ),
        )
      ],
    );
  }
}
