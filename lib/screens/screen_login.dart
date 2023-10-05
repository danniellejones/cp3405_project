import 'package:cp3405_project/main.dart';
import 'package:cp3405_project/models/firebase_retrievel.dart';
// import 'package:cp3405_project/models/student.dart';
// import 'package:cp3405_project/models/teacher.dart';
import 'package:cp3405_project/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool validate = false;
  bool isRememberMe = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String userType = '';

  final FirebaseRetrieval firebaseRetrieval = FirebaseRetrieval();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String _validateUser() {
    // New code
    // Checks if user is on the correct device and then processed to correct page.
    userType = firebaseRetrieval.checkIfTeacherOrStudent();
    if (userType == 'Teacher' && kIsWeb) {
      // Teacher teacher =
      //     Teacher(firebaseRetrieval.getUserData(), firebaseRetrieval.snapshot);
      return '/teacherLanding';
    } else if (userType == 'Teacher' &&
            !kIsWeb || // Not the best implementation as it refreshes screen but works.
        userType == 'Student' && kIsWeb) {
      return '/login';
    } else {
      // Student student =
      //     Student(firebaseRetrieval.getUserData(), firebaseRetrieval.snapshot);
      return '/studentLanding';
    }
  }

  void _navigateToRoute(String routeName) {
    Navigator.pushNamed(scaffoldKey.currentContext!, routeName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: scaffoldKey,
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
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 52.0),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          'Embark on Your Academic Adventure\nSign in and explore the Depths of Knowledge!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      const SizedBox(height: 30),
                      TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Email',
                              errorText: validate
                                  ? 'Please enter email address linked to your account'
                                  : null),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter password',
                            errorText:
                                validate ? 'Please enter your password' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          // Original code
                          // Navigator.pushNamed(context, _validateUser());

                          // Error checking - input fields -> later implementation

                          // New code
                          // Check user login data in firebase
                          firebaseRetrieval.retrieveEntity('Users');
                          try {
                            await firebaseRetrieval.findUserByEmail(
                                _emailController.text.toLowerCase());
                          } on Error {
                            // Later implementation -> Return "Email address not found" into a Text widget
                          }
                          firebaseRetrieval.retrieveUserData();

                          // If email exsists in firebase, check password
                          // Compare user input password with stored firedbase password
                          int passwordMatch = firebaseRetrieval
                              .comparePassword(_passwordController.text);

                          if (passwordMatch == 0) {
                            if (firebaseRetrieval.getSingleData('Active') ==
                                true) {
                              testData = 'Login Successful';
                              final routeName = _validateUser();
                              _navigateToRoute(routeName);
                            }
                          }
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
                              Navigator.pushNamed(context, '/forgotPassword');
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
                              Navigator.pushNamed(context, '/signUp');
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
        ));
  }
}
