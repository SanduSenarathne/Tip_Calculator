import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Tip Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
