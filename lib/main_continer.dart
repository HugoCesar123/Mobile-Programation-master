import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Continer"),
        ),

        body: Container(
          width: 200,
          height: 100,
          color: const Color.fromARGB(255, 14, 55, 190),
          child: Center(
            child: Text("Casa 1", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}