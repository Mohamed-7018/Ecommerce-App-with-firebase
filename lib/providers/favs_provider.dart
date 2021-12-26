import 'package:flutter/cupertino.dart';
import 'package:samir_online_store/models/fav_attr.dart';

class FavsProvider with ChangeNotifier {
  Map<String, FavsAttr> _favsItems = {};

  Map<String, FavsAttr> get getFavsItems {
    return {..._favsItems};
  }

  void addAndRemoveFromFav(
      String productId, double price, String title, String imageUrl) {
    if (_favsItems.containsKey(productId)) {
      removeItem(productId);
    } else {
      _favsItems.putIfAbsent(
          productId,
              () => FavsAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _favsItems.remove(productId);
    notifyListeners();
  }

  void clearFavs() {
    _favsItems.clear();
    notifyListeners();
  }
}
