import 'dart:async';
import 'dart:html';
import 'dart:typed_data';
import 'package:serial/serial.dart';

class SerialPortManager {
  SerialPort? _port;

  Future<void> openPort(Function(Uint8List data) onDataReceived) async {
    try {
      final port = await window.navigator.serial.requestPort();
      await port.open(baudRate: 115200);
      _port = port;
      _startReceiving(onDataReceived);
    } catch (e) {
      print("Error opening serial port: $e");
      throw e;
    }
  }

  Future<void> closePort() async {
    await _port?.close();
    _port = null;
  }

  Future<void> writeToPort(Uint8List data) async {
    if (data.isEmpty || _port == null) {
      return;
    }

    final writer = _port!.writable.writer;
    await writer.ready;
    await writer.write(data);
    await writer.ready;
    await writer.close();
  }

  Future<void> _startReceiving(Function(Uint8List data) onDataReceived) async {
    final reader = _port!.readable.reader;

    while (true) {
      try {
        final result = await reader.read();
        if (result.value != null) {
          onDataReceived(result.value);
        }
      } catch (e) {
        print('Error reading from serial port: $e');
        break; // Exit the loop on error
      }
    }
  }

  // Getter to provide port information
  String get portInfo {
    if (_port == null) {
      return "No port open";
    }

    final info = _port!.getInfo();
    String portDetails = "";

    if (info.usbVendorId != null && info.usbProductId != null) {
      portDetails = "USB Vendor ID: ${info.usbVendorId}, Product ID: ${info.usbProductId}";
    } else {
      portDetails = "Unknown Port"; // No identifying information available
    }

    return portDetails;
  }
}

