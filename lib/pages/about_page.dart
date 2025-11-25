import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Aplikasi")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Aplikasi ini dibuat oleh Gens_Putra (NPM: 000000).\nCopyright © Gens_Putra",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
