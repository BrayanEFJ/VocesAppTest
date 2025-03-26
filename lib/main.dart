import 'package:flutter/material.dart';
import 'package:vocesapp/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'nunito', // Aplica la fuente Marmelad a toda la app
      ),
     
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

