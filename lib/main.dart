import 'package:cp3405_project/screens/screen_avatar.dart';
import 'package:cp3405_project/screens/screen_class_board.dart';
import 'package:cp3405_project/screens/screen_class_view.dart';
import 'package:cp3405_project/screens/screen_forgot_password.dart';
import 'package:cp3405_project/screens/screen_landing_student.dart';
import 'package:cp3405_project/screens/screen_landing_teacher.dart';
import 'package:cp3405_project/screens/screen_mastery.dart';
import 'package:cp3405_project/screens/screen_metrics.dart';
import 'package:cp3405_project/screens/screen_questboard.dart';
import 'package:cp3405_project/screens/screen_questplanner.dart';
import 'package:cp3405_project/screens/screen_signup.dart';
import 'package:cp3405_project/screens/screen_suggestion.dart';
import 'package:cp3405_project/screens/screen_welcome.dart';
import 'package:cp3405_project/models/FirebaseRetrievel.dart';
import 'package:cp3405_project/models/Student.dart';
import 'package:cp3405_project/models/Teacher.dart';
import 'package:cp3405_project/screens/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

FirebaseRetrieval _firebase = new FirebaseRetrieval();  
var testData = '';

Future main() async {
  // Initailise Firebase Database and detect platform
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //--------------------Retrieve User data from Firebase------------------- 
  _firebase.retrieveEntity('Users');
  await _firebase.findUserByEmail('Email1'); 
  _firebase.retrieveUserData(); 
  _firebase.getUserData(); 


  //--------------------Check Login-------------------
  String firstName = _firebase.getSingleData('FirstName'); // Retrieves single field of data
  int passwordMatch = _firebase.comparePassword('password1'); 
  if (identical(passwordMatch, 0)) {
    if (identical(true, _firebase.getSingleData('Active'))) { // Checks if user account is still active. 
      // Write code here to go towards landing page where login was successful. 
      testData = 'Login Successful';
      checkUserType(); 
    }
  }
  else {
    testData = 'Login Failed';
  }

  runApp(const MyApp());
  
}


checkUserType() {
  //--------------------Check UserType-------------------
  String userType = _firebase.checkIfTeacherOrStudent(); // Outputs either 'Student' or 'Teacher' 
  if (identical(userType, 'Teacher') == true) {
    Teacher teacher = new Teacher(_firebase.getUserData(), _firebase.snapshot);
  }
  else if (identical(userType, 'Student') == true) {
     Student student = new Student(_firebase.getUserData(), _firebase.snapshot);
     List classList = student.getClasses(); // Adds all classes to a list. Specific class can be retrieved using classList[index] 

    //--------------------Add Points-------------------
    student.addPoints(1000);
    testData = student.getDOB();  
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World of SchoolCraft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      // Start Route
      initialRoute: '/',
      routes: {
        // Screens for navigation
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/teacherLanding': (context) => const LandingTeacherScreen(),
        '/studentLanding': (context) => const LandingStudentScreen(),
        '/questBoard': (context) => const QuestBoardScreen(),
        '/questPlanner': (context) => const QuestPlannerScreen(),
        '/avatar': (context) => const AvatarScreen(),
        '/metrics': (context) => const MetricsScreen(),
        '/classView': (context) => const ClassViewScreen(),
        '/classBoard': (context) => const ClassBoardScreen(),
        '/mastery': (context) => const MasteryScreen(),
        '/suggestion': (context) => const SuggestionScreen(),
      },
    );
  }
}