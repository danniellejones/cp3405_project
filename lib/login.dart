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
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34.0),
                          ),
                          SizedBox(height: 30),
                          Text(
                              'Embark on Your Academic Adventure \nSign in and Explore the Depths of Knowledge!',
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
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.blue),
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
                                    onPressed: () {},
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account?'),
                                  TextButton(
                                    onPressed: () {},
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
