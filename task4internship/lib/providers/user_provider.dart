import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/api_services.dart';


class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];
  bool isLoading = false;
  String error = "";

  ApiService api = ApiService();

  Future<void> loadUsers() async {
    try {
      isLoading = true;
      notifyListeners();

      users = await api.getUsers();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
