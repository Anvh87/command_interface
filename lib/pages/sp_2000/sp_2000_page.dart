import 'package:flutter/material.dart';

class Sp2000Page extends StatelessWidget {
  const Sp2000Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sp2000Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Sp2000Page is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
