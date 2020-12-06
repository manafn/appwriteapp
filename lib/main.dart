import 'package:flutter/material.dart';
import 'package:helloworl/core/presentaions/notifier/provider.dart';
import 'package:helloworl/features/auth/presentation/notifiers/auth_state.dart';
import 'package:helloworl/features/auth/presentation/pages/login.dart';
import 'package:helloworl/features/auth/presentation/pages/signup.dart';
import 'package:helloworl/features/general/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            buttonColor: Colors.pinkAccent,
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder()),
            buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        home: Consumer<AuthState>(builder: (context, state, child) {
          return state.isLoggedin ? Homepage() : Login();
        }),
      ),
    );
  }
}
