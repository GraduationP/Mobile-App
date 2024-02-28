import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_route/model/use_dm.dart';
import 'package:safe_route/routes/register/register.dart';
import 'package:safe_route/routes/utils/app_colors.dart';
import 'package:http/http.dart' as http;

import '../home/home.dart';

class Login extends StatefulWidget {
  static String routeName = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //    elevation: 0,
      //   title: Text("Login"),
      //   toolbarHeight: MediaQuery.of(context).size.height * .1,
      //   backgroundColor: Colors.transparent,
      //    centerTitle: true,
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login.png"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Welcome back!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                onChanged: (text) {email = text;},
                decoration: InputDecoration(
                    label: Text("Email"),
                    labelStyle: TextStyle(color: AppColors.textColor),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textColor),
                    ),
                ),style: TextStyle(color: AppColors.textColor),
              ),
              //SizedBox(height: MediaQuery.of(context).size.height * .2,),
              TextFormField(
                onChanged: (text) {password=text;},
                decoration: InputDecoration(
                  label: Text("Password"),
                  labelStyle: TextStyle(color: AppColors.textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textColor),
                  ),
                ),style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.primaryColor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 9),
                    child: Text("Login",
                        style:
                            TextStyle(fontSize: 18, color: AppColors.textColor)),
                  ),

              ),

              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Register.routeName);
                },
                child: Text("Creat account",
                    style: TextStyle(fontSize: 18, color: Colors.white70)),
              )
            ],
          ),
        ),
      ),
    );
  }
  var carId = 0;
  void login() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.0.1:4000/car_id'));
      if (response.statusCode == 200) {
        final jsonSendData = json.decode(response.body);
        carId = jsonSendData;
        setState(() {
        });
      }
      else{
        showMyDialog(
            dialogTitle: "Wrong Connection",
            message: "Can't connect to Raspberry");
      }
      showLoading();
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      UserDM user=await getUserFromFirestore(credential.user!.uid);
      UserDM.currentUser=user;
      hideLoading();

      Navigator.pushNamed(context, Home.routeName);


    } on FirebaseAuthException catch (exception) {
      hideLoading();
      if (exception.code == "user-not-found") {
        showMyDialog(
            message:
            "Wrong email address please make sure you wrote right one!");
      } else if (exception.code == "wrong-password") {
        showMyDialog(
            dialogTitle: "Error",
            message: "Wrong password please make sure your wrote right one!");
      } else {
        showMyDialog();
      }
    }
  }

  void showLoading() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(children: [
              Text("Loading .. "),
              Spacer(),
              CircularProgressIndicator()
            ]),
          );
        },
        barrierDismissible: false);
  }

  void hideLoading() {
    Navigator.pop(context);
  }

  void showMyDialog(
      {String? dialogTitle,
        String message = "something went wrong, Please try again later"}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: dialogTitle == null ? SizedBox() : Text(dialogTitle),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"))
          ],
        );
      },
    );
  }

  Future<UserDM> getUserFromFirestore(String uid) async {
  var usersCollection=  FirebaseFirestore.instance.collection("users");
  DocumentReference doc=usersCollection.doc(uid);
  DocumentSnapshot snapshot=await doc.get();
  Map json=snapshot.data() as Map;
  UserDM user=UserDM(uid, email, json["username"],json["carid"]);
  return user;
  }
}
