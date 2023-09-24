import 'package:cp3405_project/forgot_password.dart';
import 'package:cp3405_project/responsive_layout.dart';
import 'package:cp3405_project/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool validate = false;
  bool isRememberMe = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 52.0),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                        'Embark on Your Academic Adventure \nSign in and explore the Depths of Knowledge!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    const SizedBox(height: 30),
                    TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                        ),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter password'),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.blue),
                          child: Checkbox(
                            value: isRememberMe,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = value!;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const ForgotPasswordPage()));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUpPage()));
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
