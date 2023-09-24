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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp3405_project/screens/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var testData = '';

Future main() async {
  // Initailise Firebase Database and detect platform
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Database Retrieval Examples
  final studentsEntity = FirebaseFirestore.instance.collection('Students');

  final snapshot =
      await studentsEntity.where('Username', isEqualTo: 'username2').get();
  final studentData = snapshot.docChanges.first.doc.data();

  testData = '${studentData}123';
  var username = '';
  Iterable<MapEntry<String, dynamic>> entries = studentData!.entries;
  for (final entry in studentData.entries) {
    if (entry.key == 'Username') {
      testData = entry.value;
      username = entry.value;
    }
  }

  debugPrint('$entries');

  var checkUsername = 'username2';
  testData = '${username.compareTo(checkUsername)}true';

  studentsEntity.get().then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      testData = doc.toString();
    }
  });

  // Run the App
  runApp(const MyApp());
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
