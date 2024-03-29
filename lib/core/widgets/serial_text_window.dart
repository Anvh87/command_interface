import 'package:flutter/material.dart';
import 'package:command_interface/core/api/serial_cmd.dart';

class SerialTextWindow extends StatefulWidget {
  const SerialTextWindow({
    super.key,
  });

  @override
  State<SerialTextWindow> createState() => _SerialTextWindowState();
}

class _SerialTextWindowState extends State<SerialTextWindow> {
  SerialCMD serialCMD = SerialCMD();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Serial Text Window',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ), //Text
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: serialCMD.received.map((e) => Text(e)).toList(),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter commands',
                ),
                onChanged: (text) {
                  serialCMD.msgBuffer = text;
                  print(text);
                },
                onEditingComplete: () {
                  serialCMD.writeToPort();
                  print('written');
                },
              ),
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    ); //Card);
  }
}
