import 'package:cp3405_project/screens/screen_recovery_code.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/utils/responsive_layout.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool validate = false;

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
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
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 52.0),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Enter your email to send a special code to recover your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                        ),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RecoveryCodeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 5,
                            minimumSize: const Size.fromHeight(50)),
                        child: const Text(
                          'Send code',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
