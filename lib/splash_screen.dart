import 'dart:async';

import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Timer(
      const Duration(seconds: 5),
      () {

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (_) => const HomePage(),

          ),

        );

      },
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blue,

      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Image.asset(

              "assets/images/logo.png",

              width: 180,

            ),

            const SizedBox(height: 25),

            const Text(

              "Mobile UAS",

              style: TextStyle(

                color: Colors.white,

                fontSize: 30,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            const Text(

              "Pemrograman Aplikasi Mobile",

              style: TextStyle(

                color: Colors.white70,

                fontSize: 18,

              ),

            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(

              color: Colors.white,

            )

          ],

        ),

      ),

    );

  }

}