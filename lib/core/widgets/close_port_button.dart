import 'package:flutter/material.dart';
import 'package:command_interface/core/api/serial_port_manager.dart';

class ClosePortButton extends StatelessWidget {
  final SerialPortManager serialPortManager;
  final VoidCallback onPortClosed; // Callback when port is closed

  const ClosePortButton({
    Key? key,
    required this.serialPortManager,
    required this.onPortClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          await serialPortManager.closePort();
          onPortClosed(); // Call the callback to update the UI
        } catch (e) {
          print("Error closing port: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error closing port: $e')),
          );
        }
      },
      icon: const Icon(Icons.cancel_outlined),
      label: const Text('Close Port'),
    );
  }
}
