import 'dart:async';

import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/errorscreen/no_netwoek_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/routs.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _authService = AuthService();

  bool loading = false;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authService.getUserData(context: context);
    });

    super.initState();
  }


  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: (settings) => generateRoute(settings),
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor, onPrimary: Colors.white),
          primaryTextTheme: const TextTheme(),
          textTheme: const TextTheme(),
          buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(
                primary: GlobalVariables.secondaryColor,
                onPrimary: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
              color: GlobalVariables.secondaryColor,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black)),
        ),
        home: _connectionStatus.contains(ConnectivityResult.none) ? 
        const  NonetWorkScreen()
        
        :
         getHomeScreen());
  }

  Widget getHomeScreen() {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if (userProvider.user.token.isEmpty) {
        return const AuthScreen();
      } else {
        return const HomeScreen();
      }
    }
  }
}
