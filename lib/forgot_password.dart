import 'package:cp3405_project/recovery_code.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/responsive_layout.dart';

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
          decoration: const InputDecoration(
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
              MaterialPageRoute(builder: (_) => const RecoveryCodePage()));
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
                      child: Center(
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
                    padding: EdgeInsets.all(20),
                    height: height,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.2),
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34.0),
                          ),
                          SizedBox(height: 30),
                          Text(
                              'Enter your email to send a special code to recover your account',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    prefixIcon: const Icon(Icons.email),
                                    hintText: 'Email',
                                  ),
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.emailAddress),
                              SizedBox(height: 10),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'Enter password'),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 5,
                                    minimumSize: const Size.fromHeight(50)),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),
    ));
  }
}
