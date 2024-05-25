import 'dart:convert';
import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/error_handle.dart';
import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            SharedPreferences prefs = await SharedPreferences.getInstance();

            if (context.mounted) {
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(res.body);
            }
            prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BottomBar.routeName,
                (route) => false,
              );
            }
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }

  //get user data
  void getUserData({required BuildContext context,required GlobalKey<ScaffoldMessengerState> key}) async {

  
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      userProvider.setLoading(true);

      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', '');
      }

      http.Response authVerifyRes = await http.post(
          Uri.parse('$baseUrl/api/varifyToken'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-auth-token': token!
          });

      if (jsonDecode(authVerifyRes.body) == true) {
        //get user
        http.Response response = await http
            .get(Uri.parse('$baseUrl/api/getUser'), headers: <String, String>{
          'Content-Type': 'application/json',
          'x-auth-token': token
        });

        if (context.mounted) {
          userProvider.setUser(response.body);

          userProvider.setLoading(false);
        }
      } else {
        userProvider.setLoading(false);
      }
    } catch (e) {
      userProvider.setLoading(false);
      if (context.mounted) {
        key.currentState!.showSnackBar(
          const SnackBar(content: Text('Somthing went wrong'))
        );
        
        userProvider.setLoading(false);
      }
    }
  }
}
