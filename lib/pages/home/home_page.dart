import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Test1'),
          ),
                    const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Test2'),
          ),
                    const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Test3'),
          ),
          ]          
        )
      ),
    );
  }
}
