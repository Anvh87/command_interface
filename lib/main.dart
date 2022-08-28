import 'package:flutter/material.dart';
import 'package:command_interface/widgets/serial_connect';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'command interface demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('command interface demo'),
        ),
        body: ListView(
          children: [
            ConnectWidget(),
          ],
        ),
      ),
    );
  }
}
