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
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text('data'),
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/boo.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment(-0.5, 0.1),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 70, bottom: 30, left: 40),
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
                    fontFamily: 'Trajan Pro',
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 20,
                ),
                emailField(),
                Container(
                  height: 20,
                ),
                passField(),
                Container(
                  height: 20,
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
