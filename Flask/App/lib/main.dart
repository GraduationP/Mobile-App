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

  var j = 'kkkk';
  void _connectToDevice() async {
    var response = await http.get(Uri.parse('http://10.0.0.1:4000/send-data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      j = jsonData;
      print(jsonData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _connectToDevice,
              child: Text('Connect to Device Second way'),
            ),
            Text('Null l7d ma n4oflha sa7b'),
            Text(j ?? 'null'),
          ],
        ),
      ),
    );
  }
}
