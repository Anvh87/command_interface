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

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.usb, 'BUTTON 1'),
        _buildButtonColumn(color, Icons.usb_off, 'BUTTON 2'),
      ],
    );

    Widget buttonConnect = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ConnectWidget(),
      ],
    );

    return MaterialApp(
      title: 'command interface demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('command interface demo'),
        ),
        body: ListView(
          children: [
            buttonConnect,
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
