import 'package:cp3405_project/login.dart';
import 'package:cp3405_project/responsive_layout.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                            image: AssetImage('lib/assets/img_classroom.png'),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 58.0),
                    ),
                    const SizedBox(height: 30),
                    const Text('Enter and confirm new password',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    const SizedBox(height: 30),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'New Password',
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Confirm password',
                        ),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 5,
                            minimumSize: const Size.fromHeight(50)),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
