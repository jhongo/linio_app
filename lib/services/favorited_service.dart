import 'package:flutter/material.dart';

class FavoritedService extends ChangeNotifier {
  bool _isFavorited = false;

  bool get isFavoritedGet {
    return _isFavorited;
  }

  set isFavoritedSet(bool favorite) {
    _isFavorited = favorite;
    notifyListeners();
  }
}
