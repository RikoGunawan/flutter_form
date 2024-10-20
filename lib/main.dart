import 'package:flutter/material.dart';
import 'package:myapp/form_screen.dart';
// import 'home_screen.dart'; // Pastikan kamu mengimpor HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormScreen(), // HomeScreen dijadikan sebagai halaman utama
    );
  }
}
