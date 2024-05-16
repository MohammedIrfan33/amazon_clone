import 'dart:convert';
import 'package:amazon_clone/constants/error_handle.dart';
import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //signup
  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      UserModel user = UserModel(
          uaerId: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          name: name);

      http.Response res = await http.post(Uri.parse('$baseUrl/api/signup'),
          body: jsonEncode(user.toMap()),
          headers: <String, String>{'Content-Type': 'application/json'});

      if (context.mounted) {
        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () {
              showSnackBar(
                  context: context,
                  text: 'Account created ! login  your account');
            });
      }
    } catch (e) {
      print(e);
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }

  //signup
  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserModel user = UserModel(
          uaerId: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          name: '');

      http.Response res = await http.post(Uri.parse('$baseUrl/api/signin'),
          body: jsonEncode(user.toMap()),
          headers: <String, String>{'Content-Type': 'application/json'});

      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            print(res.body);

            SharedPreferences prefs = await SharedPreferences.getInstance();

            if (context.mounted) {
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(res.body);
            }
            prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (route) => false,
              );
            }

            print('login success');
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }
}
