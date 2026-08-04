import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expended Example',
      home: Scaffold(
        appBar: AppBar(title: Text("Expended")),
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 255, 17, 0),
              child: const Center(
                child: Text("Header", style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 12, 4, 97),
                child: const Center(
                  child: Text(
                    "Ocupa todo espaço restante",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
