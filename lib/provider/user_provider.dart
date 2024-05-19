import 'dart:convert';

import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    name: '',
    uaerId: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );
  bool loading =  false;

  UserModel get user => _user;


  void setLoading(bool value){
    loading = value;
    notifyListeners();

  }

  void setUser(String user) {


  
    _user = UserModel.fromJson(jsonDecode(user));

    
    notifyListeners();
  }
}
