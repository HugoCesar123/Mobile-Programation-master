import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorTela(),

    );
  }
}

class ContadorTela extends StatefulWidget {
  const ContadorTela({super.key});

  @override
    _ContadorTelaState createState() => _ContadorTelaState();
}

class _ContadorTelaState extends State<ContadorTela> {
  int contador = 0;

  void incrementar(){
    setState(() {
      contador++;
    });
  }

  void descrementar(){
    setState(() {
      if (contador > 0){
        contador--;
      };
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo de Curtidas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 60,
              color: Colors.red,
            ),

            SizedBox(height: 20,),

            Text(
          "$contador curtidas",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                
          FloatingActionButton.extended(
          onPressed: incrementar,
          icon: Icon(Icons.thumb_up_alt_sharp, color: const Color.fromARGB(255, 4, 118, 8),),
          label: Text("Curtir", style: TextStyle(color: Colors.black),),
          backgroundColor: const Color.fromARGB(255, 63, 227, 68),
          ),

          SizedBox(width: 20,),

          FloatingActionButton.extended(
          onPressed: descrementar,
          icon: Icon(Icons.thumb_down_alt_sharp, color: const Color.fromARGB(255, 149, 3, 3),),
          label: Text("Descurtir", style: TextStyle(color: Colors.black),),
          backgroundColor: const Color.fromARGB(255, 230, 71, 60),
          ),
            ],
          )

          ],
        )
      ),
    );
  }
}
