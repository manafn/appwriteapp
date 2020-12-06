import 'package:flutter/material.dart';
import 'package:helloworl/features/auth/presentation/notifiers/auth_state.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(250),
          children: [
            Text("Login", style: Theme.of(context).textTheme.headline3),
            SizedBox(height: 30),
            TextField(
              controller: _name,
              decoration: InputDecoration(hintText: "Name"),
            ),
            SizedBox(height: 20),
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
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.signup(_name.text, _email.text, _password.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

