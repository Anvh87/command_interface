import 'package:flutter/material.dart';

class PumpsPage extends StatelessWidget {
  const PumpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PumpsPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PumpsPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
