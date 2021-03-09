import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsportal/src/auth/auth.dart';
import 'package:newsportal/src/layouts/login/login.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onSignedIn;
  const SplashScreen({Key key, this.onSignedIn}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    currentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> currentUser() async {
    if (_authService.currentUser() == null) {
      new Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(onSignedIn: widget.onSignedIn),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_VyblYx.json'),
      ),
    );
  }
}
