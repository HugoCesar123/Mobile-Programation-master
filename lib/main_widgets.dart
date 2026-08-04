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
        appBar: AppBar(title: Text("Minha tela")),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.precision_manufacturing,
                size: 60,
                color: Colors.black,
              ),

              SizedBox(width: 20, height: 20),

              Text(
                "D.S é o melhor curso do SESI?",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print("Usuário clicou");
                },
                child: Text("Curtir"),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        "Caixa 1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Caixa 2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Caixa 3",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
