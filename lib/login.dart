import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;

  Widget buildUsername() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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

  Widget buildForgotPasswordBtn() {
    return Container(
      height: 20,
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot button pressed'),
        child: const Text(
          'Forgot Password?',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRememberMeCb() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.blueAccent),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              )),
          const Text(
            'Remember me',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

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
          const SizedBox(height: 20),
          buildPassword(),
          buildForgotPasswordBtn(),
          buildRememberMeCb()
        ],
      ),
    ));
  }
}
