import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

Widget buildName() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
            hintText: 'First name'),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
            hintText: 'Last name'),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
      )
    ],
  );
}

Widget buildEmail() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
            hintText: 'Email'),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
      ),
    ],
  );
}

Widget buildPassword() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: 'Enter password'),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text, // Not sure if name is correct
      ),
    ],
  );
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World of Schoolcraft'),
      ),
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            buildName(),
            const SizedBox(height: 20),
            buildEmail(),
            const SizedBox(height: 20),
            buildPassword()
          ])),
    );
  }
}
