import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible Example',
      home: Scaffold(
        appBar: AppBar(title: Text("Flexible")),
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: 120,
                color: const Color.fromARGB(255, 177, 177, 177),
                child: const Center(child: Text("1 parte", style: TextStyle(color: Colors.black),)),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                height: 120,
                color: const Color.fromARGB(255, 0, 0, 0),
                child: const Center(child: Text("2 parte", style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
