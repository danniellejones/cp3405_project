import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(fontSize: 40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Username'),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                textAlign: TextAlign.center),
          )
        ],
      ),
    ));
  }
}
