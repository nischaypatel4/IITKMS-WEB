import 'package:flutter/material.dart';
import 'package:iitkms/screens/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iitkms/widgets/Firebase_Button.dart';
import 'package:iitkms/widgets/Text_Fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'BrunoAce',
                fontSize: 20,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'DESIGN. ', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'BUILD. ', style: TextStyle(color: Colors.red)),
                TextSpan(
                    text: 'RACE.', style: new TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text('Welcome!',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 40,
                color: Colors.white,
              )),
          const Text('Login to your account',
              style: TextStyle(
                fontFamily: 'Coolvetica',
                fontSize: 20,
                color: Colors.white,
              )),
          const SizedBox(
            height: 30,
          ),
          // LoginField(hintText: "User ID"),
          // const SizedBox(
          //   height: 20,
          // ),
          // LoginField(hintText: "Password"),
          // const SizedBox(
          //   height: 20,
          // ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: reusableTextField(
                "User ID", Icons.person_outline, false, _emailTextController),
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: reusableTextField(
                "Password", Icons.lock_outline, true, _passwordTextController),
          ),
          const SizedBox(
            height: 20,
          ),
          firebaseUIButton(context, "Sign In", () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                .then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          }),
        ])),
      ),
    );
  }
}
