import 'package:flutter/material.dart';
import 'widgets/serial_cmd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  SerialCMD serialCMD = SerialCMD();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Serial'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: serialCMD.received.map((e) => Text(e)).toList(),
              ),
            ),
            ElevatedButton(
              child: const Text('Open Port'),
              onPressed: () {
                serialCMD.openPort();
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            ),
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter commands',
                ),
                onChanged: (text) {
                  serialCMD.msgBuffer = text;
                },
                onEditingComplete: () {
                  serialCMD.writeToPort();
                }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            ),
            ElevatedButton(
              child: const Text('Send'),
              onPressed: () {
                serialCMD.writeToPort();
              },
            ),
          ],
        ),
      ),
    );
  }
}
