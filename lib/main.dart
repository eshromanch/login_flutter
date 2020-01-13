import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  final finalkey = GlobalKey<FormState>();
  // const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/boo.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment(-0.5, 0.1),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          color: Colors.transparent,
          child: Form(
            key: finalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Schyler',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10,
                ),
                emailField(),
                Container(
                  height: 9,
                ),
                passField(),
                Container(
                  height: 8,
                ),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String value) {
        var c = value.contains("@");
        var d = value.contains(".com");
        var F = c && d;
        if (!F) {
          return 'please enter a valid email';
        }
      },
      onSaved: (String value) {
        print(value);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'you@example.com',
          labelText: 'Email',
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
          )),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          )),
    );
  }

  Widget passField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: (String value) {
        if (value.length < 8) {
          return 'pass should be > 7';
        }
        ;
      },
      onSaved: (String value) {
        print(value);
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'who cares!',
          icon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
          )),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          )),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (finalkey.currentState.validate()) {
          finalkey.currentState.save();
        }
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
