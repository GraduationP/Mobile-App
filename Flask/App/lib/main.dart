import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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

    void _connectToDevice() async {
      var response = await http.get(Uri.parse('http://192.168.1.4:5000/'));
      if (response.statusCode == 200) {
        print(response.body);
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
            ElevatedButton(
              onPressed: ()
              async { //while(true){
              var response = await http.get(Uri.parse('http://192.168.1.4:5000/'));
              if (response.statusCode == 200) {
              print(response.body);
            } else {
              print('Request failed with status: ${response.statusCode}.');
            }
              //}
            },
              child: Text('Connect to Device'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _connectToDevice, child: Text('Connect to Device Second way'),
            ),
            Text('Null l7d ma n4oflha sa7b'),
          ],
        ),
      ),
    );
  }
}
