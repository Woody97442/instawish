import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm();

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String username = "woody97442@hotmail.fr";
  String password = "woody97442@hotmail.fr";
  String serverUrl = "https://127.0.0.1:8000/api/";

  @override
  Widget build(BuildContext context) {
    login() async {
      var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
      var url = Uri.parse('${serverUrl}login_check');

      var body = {'username': username, 'password': password};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      print(req.body);
      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        // print(resBody);
        // save token in local storage (shared preferences)
        var token = json.decode(resBody)['token'];
        print(token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        // redirect to home page
      } else {
        print(res.reasonPhrase);
      }
    }

    return Column(
      children: [
        SizedBox(height: 10),
        Image(image: AssetImage("assets/logo.png"), height: 100),
        SizedBox(height: 10),
        Text(
          "InstaWish",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15,
                offset: Offset(0.0, 0.75),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Username",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15,
                offset: Offset(0.0, 0.75),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            login();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan[300],
            foregroundColor: Colors.white,
            shadowColor: Colors.grey,
            elevation: 10,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text(
            "Register",
            style: TextStyle(
                fontSize: 18, letterSpacing: 1.5, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
