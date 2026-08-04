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
          title: Text("Row"),
        ),

        body: Center(
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Icon(Icons.home, size: 40,),

            SizedBox(width: 20,),

            Icon(Icons.favorite, size: 40,),

            SizedBox(width: 20,),

            Icon(Icons.settings, size: 40,)
           ],          
          ),
        ),
      ),
    );
  }
}