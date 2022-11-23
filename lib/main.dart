import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SHELL APP',
              style: GoogleFonts.roboto(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              'GO+',
              style: GoogleFonts.roboto(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffFFD500),
      nextScreen: const LoginPage(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
