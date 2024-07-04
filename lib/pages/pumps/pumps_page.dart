import 'package:flutter/material.dart';
import 'package:command_interface/core/widgets/open_port_button.dart';
import 'package:command_interface/core/widgets/serial_data_display.dart';
import 'package:command_interface/core/api/serial_port_manager.dart';

class PumpsPage extends StatefulWidget {
  const PumpsPage({Key? key}) : super(key: key);

  @override
  State<PumpsPage> createState() => _PumpsPageState();
}

class _PumpsPageState extends State<PumpsPage> {
  final _serialPortManager = SerialPortManager();

  @override
  void dispose() {
    _serialPortManager.closePort();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: OpenPortButton(
              serialPortManager: _serialPortManager,  // Pass the SerialPortManager to the button
              onDataReceived: (data) {
                // Handle received data here if needed
                print("Received data: ${String.fromCharCodes(data)}");
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: SerialDataDisplay(serialPortManager: _serialPortManager),
      ),
    );
  }
}
