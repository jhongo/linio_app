import 'package:flutter/material.dart';

class MenuService extends ChangeNotifier {
  int _itemSelected = 0;
  PageController _pageController = PageController();

  int get itemSelectedGet {
    return _itemSelected;
  }

  PageController get pageControllerGet {
    return _pageController;
  }

  set itemSelectedSet(int opc) {
    _itemSelected = opc;

    _pageController.animateToPage(opc,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    notifyListeners();
  }
}
