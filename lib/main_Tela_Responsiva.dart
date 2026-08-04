import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
    
        body: Center(
        child: SingleChildScrollView(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            SizedBox(height: 150,),
            Icon(Icons.lock, size: 90, color: Colors.blue,),

            SizedBox(height: 30,),
            Text(
              "Login",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),

            SizedBox(height: 30,),

            SizedBox(
                width: largura * 0.90,
                height: 50,
                child: ElevatedButton(
                onPressed: (){},
                child: Text("Entrar", style: TextStyle(color: Colors.deepPurple) ),),
            ),
            

            SizedBox(height: 30,),
            
            Container(
                child: Center(
                    child: Text("Criar Conta", style: TextStyle(color: Colors.deepPurpleAccent),),
                )
            ),
            
            SizedBox(height: 2000,)
           ],          
          ),
        ),
        ),
      ),
    );
  }
}