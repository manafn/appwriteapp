import 'package:flutter/material.dart';
import 'package:helloworl/features/auth/presentation/notifiers/auth_state.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loign'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: [
            Text("Login", style: Theme.of(context).textTheme.headline3),
            SizedBox(height: 30),
            TextField(
              controller: _email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 20),
            Center(
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.login(_email.text, _password.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
