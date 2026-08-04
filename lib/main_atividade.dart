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
        appBar: AppBar(title: Text("Column")),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                color: const Color.fromARGB(255, 14, 55, 190),
                child: Center(
                  child: Text("Caixa 1", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(width: 20, height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(width: 80, height: 80, color: Colors.red, child: Center(
                  child: Text("Caixa 2", style: TextStyle(color: Colors.white),),
                ),
                ),
                SizedBox(width: 20, height: 20),
                Container(width: 80, height: 80, color: Colors.green,  child: Center(
                  child: Text("Caixa 3", style: TextStyle(color: Colors.white),),
                ),)
              ],)


            ],
          ),
        ),
      ),
    );
  }
}
