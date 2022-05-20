import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aid/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, registerPage);
        });
      } else {
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, learnPage);
        });
      }
    });
  }

  @override
  void dispose() {
    _navigatetohome;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(36.0),
              child: Image(
                fit: BoxFit.fill,
                width: 75,
                height: 75,
                alignment: Alignment.center,
                image: AssetImage("assets/images/regimage.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
