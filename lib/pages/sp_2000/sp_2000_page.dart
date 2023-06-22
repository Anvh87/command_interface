import 'package:flutter/material.dart';
import 'package:command_interface/core/api/serial_cmd.dart';
import 'package:command_interface/core/widgets/open_port_button.dart';

class Sp2000Page extends StatelessWidget {
  const Sp2000Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SP2000'),
        centerTitle: true,
        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0), child: OpenPortButton()),
        ],
      ),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ])),
    );
  }
}
