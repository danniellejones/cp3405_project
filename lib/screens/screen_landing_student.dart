import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/landing_student_widget.dart';
import 'package:cp3405_project/widgets/pomodoro_widget.dart';
import 'package:flutter/material.dart';

class LandingStudentScreen extends StatelessWidget {
  const LandingStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Dashboard',
      content: [
        LandingStudentWidget(),
        PomodoroWidget(),
      ],
    );
  }
}
