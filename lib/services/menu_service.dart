import 'package:flutter/material.dart';

class MenuService extends ChangeNotifier {
  int _itemSelected = 0;

  int get itemSelectedGet {
    return _itemSelected;
  }

  set itemSelectedSet(int opc) {
    _itemSelected = opc;
    notifyListeners();
  }
}
