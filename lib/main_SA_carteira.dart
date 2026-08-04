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
        appBar: AppBar(title: Text("Cartão"), centerTitle: true),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color.fromARGB(235, 0, 0, 0)
            ),
            child: Column(  
              children: [
                Row(
                  children: [
                    Image.asset(
                       'assets/images/logo_santander.png',
                       width: 30,
                    ),
                    SizedBox(width: 20,),
                    Text("Santander", style: TextStyle(color: Colors.white, fontSize: 22  ),),
                    SizedBox(width: 120,),
                    Icon(Icons.contactless, color: Colors.white, size: 30,),
                  
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 265,),
                    Icon(Icons.sim_card, color: const Color.fromARGB(255, 167, 160, 160), size: 37,)
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    Text("0000  0000  0000  0000", style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 12,),
                    Text("Titular", style: TextStyle(color: Colors.white, fontSize: 9),),
                    SizedBox(width: 220,),
                    Text("Validade", style: TextStyle(color: Colors.white, fontSize: 9),),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(width: 12),
                    Text("João Vitor Guiaro Gomes", style: TextStyle(color: Colors.white, fontSize: 12),),
                    SizedBox(width: 110,),
                    Text("12/32", style: TextStyle(color: Colors.white, fontSize: 12),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
              Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color.fromARGB(235, 180, 8, 8)
            ),
            child: Column(  
              children: [
                Row(
                  children: [
                    Image.asset(
                       'assets/images/logo_santander.png',
                       width: 30,
                    ),
                    SizedBox(width: 20,),
                    Text("Santander", style: TextStyle(color: Colors.white, fontSize: 22  ),),
                    SizedBox(width: 120,),
                    Icon(Icons.contactless, color: Colors.white, size: 30,),
                  
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 265,),
                    Icon(Icons.sim_card, color: const Color.fromARGB(255, 167, 160, 160), size: 37,)
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    Text("0000  0000  0000  0000", style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 12,),
                    Text("Titular", style: TextStyle(color: Colors.white, fontSize: 9),),
                    SizedBox(width: 220,),
                    Text("Validade", style: TextStyle(color: Colors.white, fontSize: 9),),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(width: 12),
                    Text("João Vitor Guiaro Gomes", style: TextStyle(color: Colors.white, fontSize: 12),),
                    SizedBox(width: 110,),
                    Text("12/32", style: TextStyle(color: Colors.white, fontSize: 12),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color.fromARGB(235, 15, 3, 96)
            ),
            child: Column(  
              children: [
                Row(
                  children: [
                    Image.asset(
                       'assets/images/logo_santander.png',
                       width: 30,
                    ),
                    SizedBox(width: 20,),
                    Text("Santander", style: TextStyle(color: Colors.white, fontSize: 22  ),),
                    SizedBox(width: 120,),
                    Icon(Icons.contactless, color: Colors.white, size: 30,),
                  
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 265,),
                    Icon(Icons.sim_card, color: const Color.fromARGB(255, 167, 160, 160), size: 37,)
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    Text("0000  0000  0000  0000", style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 12,),
                    Text("Titular", style: TextStyle(color: Colors.white, fontSize: 9),),
                    SizedBox(width: 220,),
                    Text("Validade", style: TextStyle(color: Colors.white, fontSize: 9),),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(width: 12),
                    Text("João Vitor Guiaro Gomes", style: TextStyle(color: Colors.white, fontSize: 12),),
                    SizedBox(width: 110,),
                    Text("12/32", style: TextStyle(color: Colors.white, fontSize: 12),),
                  ],
                ),
              ],
            ),
          ),
            ],
          )
        ),
      ),
    );
  }
}
