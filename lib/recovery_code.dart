import 'package:cp3405_project/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({super.key});

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
            textStyle: const TextStyle(fontSize: 20.0, color: Colors.blue),
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
      const Text('Did\'t receive recovery code?'),
      TextButton(
        onPressed: () => showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: const Text(
                    'Re-sent recovery code',
                  ),
                  content: const Text(
                      'Never fear!\nWe re-sent you a new recovery code.\nPlease check your email.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'Okay'),
                        child: const Text('Okay')),
                  ],
                ))),
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
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ResetPasswordPage()));
        },
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verification',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Text(
                'We sent you a recovery code, enter it below.\n\nRecovery code was sent to your_email@example.com'),
            buildRecoveryCode(),
            const SizedBox(height: 20),
            buildResendCode(),
            const SizedBox(height: 20),
            buildVerifyBtn()
          ],
        ),
      ),
    );
  }
}
