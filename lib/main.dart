import 'package:flutter/material.dart';
import 'package:homework41/views/pages/home_page.dart';

void main() {
  runApp(const MainRunner());
}

/// [Saidazimov Tohir]

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
