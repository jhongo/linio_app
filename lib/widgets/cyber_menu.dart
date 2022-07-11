import 'package:flutter/material.dart';
import 'package:linio_app/models/menu_models.dart';
import 'package:linio_app/services/menu_service.dart';
import 'package:provider/provider.dart';

class CyberMenu extends StatelessWidget {
  final List<MenuModel> itemsMenu = [
    MenuModel(
        onPressed: () {
          print('Home Icon');
        },
        icon: Icons.home_outlined),
    MenuModel(
        onPressed: () {
          print('Shope Icon');
        },
        icon: Icons.shopping_bag_outlined),
    MenuModel(
        onPressed: () {
          print('Favorite Icon');
        },
        icon: Icons.favorite_border),
    MenuModel(
        onPressed: () {
          print('Person Icon');
        },
        icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(40),
          color: Colors.white),
      child: _MenuItems(
        itemsMenu: itemsMenu,
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<MenuModel> itemsMenu;
  const _MenuItems({Key? key, required this.itemsMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          itemsMenu.length,
          (index) => _CyberMenuButton(
                opc: index,
                item: itemsMenu[index],
              )),
    );
  }
}

class _CyberMenuButton extends StatelessWidget {
  final MenuModel item;
  final int opc;
  const _CyberMenuButton({Key? key, required this.item, required this.opc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<MenuService>(context);
    return GestureDetector(
      onTap: () {
        itemSelected.itemSelectedSet = opc;
      },
      child: Container(
        width: (itemSelected.itemSelectedGet == opc) ? 60 : 50,
        height: (itemSelected.itemSelectedGet == opc) ? 60 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 248, 242, 242),
        ),
        child: Icon(item.icon,
            size: (itemSelected.itemSelectedGet == opc) ? 35 : 25,
            color: (itemSelected.itemSelectedGet == opc)
                ? Colors.red
                : Colors.grey),
      ),
    );
  }
}
