import 'dart:io';
import 'dart:math';

import 'package:app_academia/models/gym.dart';
import 'package:flutter/material.dart';

class GreatGym with ChangeNotifier {
  List<Gym> _items = [];

  List<Gym> get items {
    return [..._items];
  }

  Gym gymByIndex(int index) {
    return _items[index];
  }

  void addGym(String title, File image) {
    final newGym = Gym(
      id: Random().nextDouble().toString(),
      name: title,
      location: null,
      image: image,
    );

    _items.add(newGym);
    notifyListeners();
  }
}
