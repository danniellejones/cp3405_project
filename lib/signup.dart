import 'package:cp3405_project/login.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/responsive_layout.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    SizedBox(height: 50),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 52.0),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sign up and explore the Depths of Knowledge!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'First name',
                              errorText:
                                  validate ? 'Please enter first name' : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Last name',
                              errorText:
                                  validate ? 'Please enter last name' : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          controller: lastNameController,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Email',
                              errorText:
                                  validate ? 'Please enter email' : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          controller: emailController,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Enter password',
                              errorText:
                                  validate ? 'Please enter password' : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Confirm password',
                              errorText:
                                  validate ? 'Please enter password' : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          controller: confirmPasswordController,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                firstNameController.text.isEmpty
                                    ? validate = true
                                    : validate = false;
                                lastNameController.text.isEmpty
                                    ? validate = true
                                    : validate = false;
                                emailController.text.isEmpty
                                    ? validate = true
                                    : validate = false;
                                passwordController.text.isEmpty
                                    ? validate = true
                                    : validate = false;
                                confirmPasswordController.text.isEmpty
                                    ? validate = true
                                    : validate = false;

                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: Text('Sign up complete!'),
                                          content: Text(
                                              'Adventurer!\nYou\'re account has been created.\nTime to login and explore!'),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            LoginPage())),
                                                child: Text('Okay'))
                                          ],
                                        )));
                              });
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()));
                              },
                              child: const Text(
                                'Login',
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
