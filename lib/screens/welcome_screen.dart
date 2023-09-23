import 'package:cp3405_project/screens/base_nav_widget.dart';
import 'package:cp3405_project/widgets/pomodoro_widget.dart';
import 'package:cp3405_project/widgets/state_tracker_widget.dart';
import 'package:cp3405_project/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const BaseNavigationWidget(title: 'Welcome', content: [
    // PomodoroWidget(),
    // StateTrackerWidget(),
    // ]);
    return const TitleWidget();
  }
}
