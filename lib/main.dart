import 'package:flutter/material.dart';
import 'package:command_interface/widgets/serial_connect';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Dispenser 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ChoiceChip(label: Text('5ml'), selected: true)
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    return MaterialApp(
      title: 'command interface demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('command interface demo'),
        ),
        body: ListView(
          children: [
            ConnectWidget(),
            titleSection,
          ],
        ),
      ),
    );
  }
}

// Widget buttonConnect = Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: const [
//     ConnectWidget(),
//   ],
// );
