import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, size: 80),
            SizedBox(height: 12),
            Text("Project UTS Gens", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text("Petunjuk Arah Shalat"),
          ],
        ),
      ),
    );
  }
}
