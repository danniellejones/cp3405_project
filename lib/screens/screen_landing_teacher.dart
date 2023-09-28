import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/teacher_landing/quick_quest_widget.dart';
import 'package:cp3405_project/widgets/teacher_landing/set_question_widget.dart';
import 'package:cp3405_project/widgets/teacher_landing/state_tracker_widget.dart';
import 'package:flutter/material.dart';

class LandingTeacherScreen extends StatelessWidget {
  const LandingTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Real-Time Controls',
      content: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuickQuestWidget(),
                    SetQuestionWidget(),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StateTrackerWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
