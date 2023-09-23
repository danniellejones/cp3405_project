import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class RecoveryCodePage extends StatefulWidget {
  @override
  State<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends State<RecoveryCodePage> {
  Widget buildRecoveryCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
            keyboardType: TextInputType.number,
            underlineColor: Colors
                .amber, // If this is null it will use primaryColor: Colors.red from Theme
            length: 6,
            cursorColor:
                Colors.blue, // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            onCompleted: (value) {},
            onEditing: (value) {})
      ],
    );
  }

  Widget buildResendCode() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Did\'t receive OTP?'),
      TextButton(
        onPressed: () {
          // Resent the code
        },
        child: const Text(
          'Resend code',
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
  }

  Widget buildVerifyBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 5,
            minimumSize: const Size.fromHeight(50)),
        child: const Text(
          'Verify',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('World of Schoolcraft')),
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
                'We sent you a recovery code, enter it below.\n\nRecovery code was sent to your_email@example.com'),
            buildRecoveryCode(),
            SizedBox(height: 20),
            buildResendCode(),
            SizedBox(height: 20),
            buildVerifyBtn()
          ],
        ),
      ),
    );
  }
}
