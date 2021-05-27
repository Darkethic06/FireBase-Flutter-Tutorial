import 'package:data/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SignInButton(Buttons.Google,
                text: "Sign up with Google", 
                onPressed: () {
                  final provider = Provider.of<SignInProvider>(context , listen: false);
                  provider.googleLogin();
                }),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
