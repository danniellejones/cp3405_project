import 'package:cp3405_project/screens/nav_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:cp3405_project/widgets/pomodoro_widget.dart';
import 'package:cp3405_project/widgets/state_tracker_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Login',
      content: [
        PomodoroWidget(),
        StateTrackerWidget(),
      ],
    );
  }
}
