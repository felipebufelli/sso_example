import 'package:flutter/material.dart';

enum AutenticationState { initial, loading, error, sucess }

class AutenticationController extends ChangeNotifier {
  AutenticationState _state = AutenticationState.initial;
  String errorMsg;

  set state(AutenticationState value) {
    _state = value;
    notifyListeners();
  }

  AutenticationState get state => _state;

  Future<void> authenticate() async {
    try {
      state = AutenticationState.loading;
      await Future.delayed(const Duration(seconds: 2));
      state = AutenticationState.sucess;
    } catch (e) {
      debugPrint("Autentication Error: $e");
      errorMsg = "Autentication Error: $e";
      state = AutenticationState.error;
    }
  }
}
