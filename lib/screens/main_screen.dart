import 'package:flutter/material.dart';
import 'package:linio_app/screens/screens.dart';
import 'package:linio_app/services/menu_service.dart';
import 'package:provider/provider.dart';

import '../widgets/cyber_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentPage = Provider.of<MenuService>(context);
    return Stack(
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: currentPage.pageControllerGet,
          children: [
            HomeScreen(),
            ProductScreen(),
            CheckOutScreen(),
            ProfileScreen(),
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
