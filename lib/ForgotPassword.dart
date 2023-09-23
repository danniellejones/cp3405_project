import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var emailController = TextEditingController();

  bool validate = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
            hintText: 'Email',
          ),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        )
      ],
    );
  }

  Widget buildSendCodeBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RecoveryCodePage()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 5,
            minimumSize: const Size.fromHeight(50)),
        child: const Text(
          'Send code',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

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
                'Don\'t worry! Just enter your account email and we will send you a recovery code.'),
            SizedBox(height: 50),
            buildEmail(),
            SizedBox(height: 20),
            buildSendCodeBtn()
          ],
        ),
      ),
    );
  }
}

class RecoveryCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('World of Schoolcraft')),
    );
  }
}
