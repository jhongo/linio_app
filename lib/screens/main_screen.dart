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
<<<<<<< HEAD
            const ProductScreen(),
            const CheckOutScreen(),
            const ProfileScreen()
=======
            ProductScreen(),
            CheckOutScreen(),
            ProfileScreen(),
>>>>>>> 2f94cb05c928a7459ac0238f67537c54e03327db
          ],
        ),
        Positioned(
          bottom: 15,
          child: Container(
            height: 90,
            width: size.width,
            child: CyberMenu(),
          ),
        )
      ],
    );
  }
}
