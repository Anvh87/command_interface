import 'package:flutter/material.dart';
import 'package:command_interface/core/widgets/open_port_button.dart';
import 'package:command_interface/core/widgets/serial_text_window.dart';

class PumpsPage extends StatelessWidget {
  const PumpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pumps'),
        centerTitle: true,
          actions: const <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: OpenPortButton()
    ),
  ],
      ),
      body: const Center(
        child: SerialTextWindow()
      ),
    );
  }
}
