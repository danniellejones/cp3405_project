import 'package:cp3405_project/landing_student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:io';

void main() {
  runApp(LoadingScreenApp());
}

class LoadingScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World of SchoolCraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}

void openStudentScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoadingStudent()),
  );
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // if identifying credentials and whether or not they require student / teacher
    // redirection we will show a loading animation for now ill just simulate it
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        // Platform.isWindows? :
        openStudentScreen(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World of SchoolCraft'),
      ),
      body: Center(
        child: isLoading
            ? Column(
                //is loading animation tiume
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Loading...',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                // no longer loading
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(kIsWeb
                      ? 'website'
                      : Platform.isWindows
                          ? 'windows'
                          : Platform.isAndroid || Platform.isIOS
                              ? 'mobile'
                              : 'who what when where why?'),
                ],
              ),
      ),
    );
  }
}
