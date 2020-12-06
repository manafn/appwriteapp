import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:helloworl/core/app_constant.dart';
import 'package:helloworl/features/auth/data/user.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;
  User _user;
  bool _isLoggedin;
  String _error;



  AuthState() {
    _init();
  }

  bool get isLoggedin => _isLoggedin;
  User get user => _user;
  String get error => _error;

  _init() {
    _user = null;
    _isLoggedin = false;
    // account = Account(client);

    account = Account(client);

    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectID);

    _checkloggedin();
  }



  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      print(res);
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  _checkloggedin() async {
    try {
      var check = await _getAccount();
      if (check == null) {
        _isLoggedin = false;
        print("not logged in");
      } else {
        _user = check;
        _isLoggedin = true;
        print("logged in");
        notifyListeners();
      }
    } catch (e) {
      print(e.message);
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createSession(email: email, password: password);
      print(result);

      if (result.statusCode == 201) {
        _isLoggedin = true;
        _user = await _getAccount();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  signup(String name, String email, String password) async {
    try {
      var result =
          await account.create(name: name, email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
