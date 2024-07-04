import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:command_interface/core/api/serial_port_manager.dart';

class OpenPortButton extends StatefulWidget {
  final SerialPortManager serialPortManager;
  final Function(Uint8List data)? onDataReceived;

  const OpenPortButton({
    super.key,
    required this.serialPortManager,
    this.onDataReceived,
  });

  @override
  State<OpenPortButton> createState() => _OpenPortButtonState();
}

class _OpenPortButtonState extends State<OpenPortButton> {
  bool _isConnected = false;
  String _portInfo = "No port open";

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: _isConnected
          ? null
          : () async {
        try {
          await widget.serialPortManager.openPort((data) {
            if (widget.onDataReceived != null) {
              widget.onDataReceived!(data);
            }
            // update port info
            setState(() {
              _portInfo = widget.serialPortManager.portInfo;
              _isConnected = true;
            });
          });
        } catch (e) {
          print("Error opening port: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error opening port: $e')),
          );
        }
      },
      icon: const Icon(Icons.settings_input_hdmi_outlined),
      label: Text(_isConnected ? 'Connected: $_portInfo' : 'Open Port'),
    );
  }
}
