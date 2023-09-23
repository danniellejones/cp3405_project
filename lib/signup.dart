import 'package:cp3405_project/login.dart';
import 'package:cp3405_project/responsive_layout.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool validate = false;

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
                          SizedBox(height: height * 0.1),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34.0),
                          ),
                          SizedBox(height: 30),
                          Text(
                              'It\'s time to embark on Your Academic Adventure!\nSign up and discover the Depths of Knowledge!',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Icon(Icons.person),
                                        hintText: 'First name',
                                        errorText: validate
                                            ? 'Please enter first name'
                                            : null),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Icon(Icons.person),
                                        hintText: 'Last name',
                                        errorText: validate
                                            ? 'Please enter last name'
                                            : null),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Icon(Icons.email),
                                        hintText: 'Email',
                                        errorText: validate
                                            ? 'Please enter email'
                                            : null),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          prefixIcon: const Icon(Icons.lock),
                                          hintText: 'Enter password',
                                          errorText: validate
                                              ? 'Please enter password'
                                              : null),
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.text),
                                  const SizedBox(height: 10),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Icon(Icons.lock),
                                        hintText: 'Confirm password',
                                        errorText: validate
                                            ? 'Please enter password'
                                            : null),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        elevation: 5,
                                        minimumSize: const Size.fromHeight(50)),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already have an account?'),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const LoginPage()));
                                        },
                                        child: const Text(
                                          'Log in',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
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
