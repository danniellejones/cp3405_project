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
      SizedBox(height: 10),
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
      )
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
      SizedBox(height: 10),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: 'Confirm password'),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text, // Not sure if name is correct
      )
    ],
  );
}

Widget buildSignUpBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    alignment: Alignment.center,
    child: ElevatedButton(
      onPressed: () => print('Login button pressed'),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          elevation: 5,
          minimumSize: const Size.fromHeight(50)),
      child: const Text(
        'Sign Up',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
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
            const SizedBox(height: 20),
            buildName(),
            const SizedBox(height: 10),
            buildEmail(),
            const SizedBox(height: 10),
            buildPassword(),
            const SizedBox(height: 20),
            buildSignUpBtn()
          ])),
    );
  }
}
