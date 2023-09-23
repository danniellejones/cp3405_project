import 'package:cp3405_project/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/responsive_layout.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({Key? key}) : super(key: key);

  @override
  State<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends State<RecoveryCodePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
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
                            image: AssetImage(
                                'lib/assets/images/img_classroom.png'),
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
                child: Container(
                    padding: const EdgeInsets.all(20),
                    height: height,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.1),
                          const Text(
                            'Verification',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34.0),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                              'We sent you a recovery code, enter it below.\nRecovery code was sent to your_email@example.com',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                          const SizedBox(height: 20),
                          Center(
                            child: VerificationCode(
                                textStyle: const TextStyle(
                                    fontSize: 20.0, color: Colors.blue),
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
                          ),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Okay'),
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
                                          builder: (_) =>
                                              const ResetPasswordPage()));
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
                    )))
          ],
        ),
      ),
    ));
  }
}
