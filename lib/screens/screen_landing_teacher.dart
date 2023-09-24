import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/landing_teacher_widget.dart';
import 'package:cp3405_project/widgets/state_tracker_widget.dart';
import 'package:flutter/material.dart';

class LandingTeacherScreen extends StatelessWidget {
  const LandingTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Real-Time Controls',
      content: [
        LandingTeacherWidget(),
        StateTrackerWidget(),
      ],
    );
  }
}
