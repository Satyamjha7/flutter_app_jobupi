import 'package:flutter/material.dart';

class NSDCProvider extends ChangeNotifier {
  String? nsdcId;

  void login(String id) {
    nsdcId = id;
    notifyListeners();
  }
}
