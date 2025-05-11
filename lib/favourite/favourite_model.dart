import 'package:flutter/cupertino.dart';
import 'package:section_1/add_item/item.dart';

class FavouriteModel extends ChangeNotifier {
  final List<Item> _fav = [];
  List<Item> get fav => _fav;
  add(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item);
    }
    notifyListeners();
  }

  remove(Item item) {
    if (_fav.contains(item)) {
      _fav.remove(item);
    }
    notifyListeners();
  }

  isFavourite(Item item) {
    item.favourite = !item.favourite;
    item.favourite ? add(item) : remove(item);
    notifyListeners();
  }
}
