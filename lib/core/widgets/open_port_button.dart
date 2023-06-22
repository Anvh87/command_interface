import 'package:flutter/material.dart';
import 'package:command_interface/core/api/serial_cmd.dart';

class OpenPortButton extends StatefulWidget {
  const OpenPortButton({
    super.key,
  });

  @override
  State<OpenPortButton> createState() => _OpenPortButtonState();
}

class _OpenPortButtonState extends State<OpenPortButton> {
  SerialCMD serialCMD = SerialCMD();

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        onPressed: () {
          serialCMD.openPort();
        },
        icon: const Icon(Icons.settings_input_hdmi_outlined),
        label: const Text('Open Ports'));
  }
}
