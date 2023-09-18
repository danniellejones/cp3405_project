import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Widget buildUsername() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Username'),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name, // Not sure if name is correct
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter password'),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name, // Not sure if name is correct
        ),
      )
    ],
  );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          buildUsername(),
          buildPassword()
        ],
      ),
    ));
  }
}
