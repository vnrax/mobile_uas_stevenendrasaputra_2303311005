import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MobileUAS());
}

class MobileUAS extends StatelessWidget {
  const MobileUAS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mobile UAS",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}