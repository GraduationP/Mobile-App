import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothScreen(),
    );
  }
}

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? raspberryPiDevice;
  BluetoothCharacteristic? targetCharacteristic;
  String receivedData = '';

  @override
  void initState() {
    super.initState();
    scanDevices();
  }

  Future<void> scanDevices() async {
    await flutterBlue.stopScan();
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.name.isNotEmpty &&
            result.device.name == 'اسم الراسبيرى باى') {
          connectToDevice(result.device);
          break;
        }
      }
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
    setState(() {
      raspberryPiDevice = device;
    });
    discoverServices(device);
  }

  Future<void> discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.uuid.toString() == 'UUID ال') {
          setState(() {
            targetCharacteristic = characteristic;
          });
          characteristic.setNotifyValue(true);
          characteristic.value.listen((value) {
            setState(() {
              receivedData = String.fromCharCodes(value);
            });
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: scanDevices,
            child: Text('Scan Devices'),
          ),
          SizedBox(height: 16.0),
          raspberryPiDevice != null
              ? Text('Connected: ${raspberryPiDevice!.name}')
              : Text('No connected device'),
          SizedBox(height: 16.0),
          targetCharacteristic != null
              ? Text('Received Data: $receivedData')
              : SizedBox(),
        ],
      ),
    );
  }
}
