import 'package:cp3405_project/screens/screen_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/utils/responsive_layout.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class RecoveryCodeScreen extends StatefulWidget {
  const RecoveryCodeScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryCodeScreen> createState() => _RecoveryCodeScreenState();
}

class _RecoveryCodeScreenState extends State<RecoveryCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResponsiveLayout.isMobileScreen(context)
              ? const SizedBox()
              : Expanded(
                  // Left side of screen
                  child: Container(
                    height: height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img_classroom.png'),
                          fit: BoxFit.fill),
                    ),
                    child: const Center(
                      child: Text(
                        'World of Schoolcraft',
                        style: TextStyle(
                            fontSize: 48.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

          // Right side of screen
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Verification',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 52.0),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'We sent you a special recovery code, enter it below. Recovery code was sent to:\n your_email@example.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 20),
                  VerificationCode(
                      textStyle:
                          const TextStyle(fontSize: 20.0, color: Colors.blue),
                      keyboardType: TextInputType.number,
                      underlineColor: Colors
                          .amber, // If this is null it will use primaryColor: Colors.red from Theme
                      length: 6,
                      cursorColor: Colors
                          .blue, // If this is null it will default to the ambient
                      // clearAll is NOT required, you can delete it
                      // takes any widget, so you can implement your design
                      onCompleted: (value) {},
                      onEditing: (value) {}),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      'Did\'t receive recovery code?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text(
                                  'Re-sent recovery code',
                                ),
                                content: const Text(
                                    'Never fear!\n\nWe re-sent you a new recovery code.\nPlease check your email.'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Okay'),
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
                  ]),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ResetPasswordScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 5,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
