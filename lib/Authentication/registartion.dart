import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarship_vjti/Authentication/users.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.15),
            Text(
              "SCHOLAR",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.1),
            Container(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,

              child: Text(
                "REGISTER HERE",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _email = value;
              }),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _password = value;
              }),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(32))),
                onPressed: () {
                  if (_email.isEmpty || _password.isEmpty) {
                    // show error toast

                    Fluttertoast.showToast(msg: 'Please fill all fields');
                    return;
                  }
                  if (_password.length < 6) {
                    // show error toast
                    Fluttertoast.showToast(
                        msg:
                            'Weak Password, at least 6 characters are required');

                    return;
                  }

                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser.user, context);
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 19.0,color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}