import 'package:flutter/material.dart';

Widget buildEmail(){
  return Column( 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email'
      )
    ],
  )
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World of Schoolcraft'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ), 
            SizedBox(height: 50), 
            Text(
              'Don\t worry! Just enter your account email and we will send you a recovery code.'
            ),
            SizedBox(height: 50),
            buildEmail(),
          ],
        ),
      ),
    );
  }
}
