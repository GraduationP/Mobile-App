import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

// Ideal time to initialize
await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
}
/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectionScreen(),
    );
  }
}

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  List profileData = [];
  List carData = [];
  List carInfo = [];
  String _email='', _password='';
  String str = 'Testing variable: HI!';
  int carId = 0;
  @override
  void initState() {
    super.initState();
  }
  void _connectToDevice(url, page) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonSendData = json.decode(response.body);
      if (page == 'profile'){
        profileData.addAll(jsonSendData);}
      else if (page == 'carData'){
        carData.addAll(jsonSendData);
      }
      else if (page == 'carInfo'){
        carInfo.addAll(jsonSendData);
      }
      else if (page == 'carId'){
        carId = jsonSendData;
      }
      setState(() {
      });
      print(jsonSendData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Connection'),
      ),
      body: Center(
        child: ListView(
          children: [
            TextField(
          decoration: InputDecoration(hintText: "Enter Your Email"), 
          onChanged: (value){
            setState((){
            this._email = value;
          });},
        ),
        TextField(
          decoration: InputDecoration(hintText: "Enter Your Password"), 
          onChanged: (value){
            setState((){
            this._password = value;
          });},
        ),
        ElevatedButton(onPressed: (){}, child: Text('Login')),
        TextButton(onPressed: (){}, child: Text('Register')),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/profile_info', 'profile');
              },
              child: const Text('Connect to profile info'),
            ),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/car_info', 'carInfo');
              },
              child: const Text('Connect to car info'),
            ),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/car_data', 'carData');
              },
              child: const Text('Connect to car data'),
            ),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                _connectToDevice('http://10.0.0.1:4000/car_id', 'carId');
              },
              child: const Text('Connect to car data'),
            ),
            Text(str),
            SizedBox(height: 5.0),
            Text(carId.toString()),
            SizedBox(height: 5.0),
            

            ...List.generate(profileData.length, (index) => Card(child: ListTile(title: Text("${profileData[index]["name"]}"),
              subtitle: Text("${profileData[index]["address"]}"),),)),
            ...List.generate(carData.length, (index) => Card(child: ListTile(title: Text("${carData[index]["speed"]}"),
                subtitle: Text("${carData[index]["charge"]}")),)),
            ...List.generate(carInfo.length, (index) => Card(child: ListTile(title: Text("${carInfo[index]["brand"]}"),
                subtitle: Text("${carInfo[index]["color"]}")),))
          ],
        ),
      ),
    );
  }
}
