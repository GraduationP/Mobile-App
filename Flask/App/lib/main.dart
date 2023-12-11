import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

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
  @override
  void initState() {
    super.initState();
  }

  void _connectToDevice(url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonSendData = json.decode(response.body);
      print(jsonSendData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/profile_info');
              },
              child: const Text('Connect to profile info'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/car_info');
              },
              child: const Text('Connect to car info'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/car_data');
              },
              child: const Text('Connect to car data'),
            ),
          ],
        ),
      ),
    );
  }
}
