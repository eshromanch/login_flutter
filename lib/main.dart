import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>() ;
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
          centerTitle: true,
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final finalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: finalkey,
        child: Column(
          children: <Widget>[
            emailField(),
            passField(),
            Container(
              margin: EdgeInsets.only(top: 7.6),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email',
      ),
    );
  }

  Widget passField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'who cares!'),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        finalkey.currentState.reset();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black),
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      color: Colors.blue,
      //padding: EdgeInsets.all(8.0),
    );
  }
}
