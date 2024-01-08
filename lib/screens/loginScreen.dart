import 'package:flutter/material.dart';
import '../components/loginForm.dart';
import '../components/registerForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool currentForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      body: Column(
        children: [
          currentForm ? LoginForm() : RegisterForm(),
          SizedBox(height: 10),
          currentForm
              ? ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        currentForm = false;
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[500],
                    foregroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        currentForm = true;
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[500],
                    foregroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      ),
    );
  }
}
