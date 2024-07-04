import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:command_interface/core/api/serial_port_manager.dart';

class SerialDataDisplay extends StatefulWidget {
  final SerialPortManager serialPortManager;

  const SerialDataDisplay({super.key, required this.serialPortManager});

  @override
  State<SerialDataDisplay> createState() => _SerialDataDisplayState();
}

class _SerialDataDisplayState extends State<SerialDataDisplay> {
  final _receivedData = <String>[];
  final _sentData = <String>[];
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.serialPortManager.openPort(_onDataReceived);
  }

  void _onDataReceived(Uint8List data) {
    setState(() {
      _receivedData.add(String.fromCharCodes(data));
      _scrollToBottom();
    });
  }

  void _onDataSent(Uint8List data) {
    setState(() {
      _sentData.add(String.fromCharCodes(data));
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _receivedData.length + _sentData.length,
        itemBuilder: (context, index) {
          if (index < _receivedData.length) {
            return Text('Received: ${_receivedData[index]}', style: const TextStyle(color: Colors.green));
          } else {
            final sentIndex = index - _receivedData.length;
            return Text('Sent: ${_sentData[sentIndex]}', style: const TextStyle(color: Colors.blue));
          }
        },
      ),
    );
  }
}
