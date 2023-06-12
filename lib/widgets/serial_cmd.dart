// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:typed_data';
import 'dart:html';
import 'dart:async';

import 'package:serial/serial.dart';

class SerialCMD {
  final received = <String>[];
  SerialPort? _port;
  String msgBuffer = '';

  Future<void> openPort() async {
    final port = await window.navigator.serial.requestPort();
    await port.open(baudRate: 9600);

    _port = port;
    readFromPort();
  }

  Future<void> writeToPort() async {
    if (_port == null) {
      return;
    }

    final writer = _port!.writable.writer;

    await writer.ready;
    await writer.write(Uint8List.fromList('$msgBuffer\r'.codeUnits));

    await writer.ready;
    await writer.close();
  }

  Future<void> readFromPort() async {
    if (_port == null) {
      return;
    }

    final reader = _port!.readable.reader;

    while (true) {
      final result = await reader.read();
      final text = String.fromCharCodes(result.value);

      received.add(text);
    }
  }
}
