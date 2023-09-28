import 'package:cp3405_project/widgets/teacher_landing/teacher_landing_widget.dart';
import 'package:flutter/material.dart';

class StateTrackerWidget extends TeacherLandingWidget {
  const StateTrackerWidget({super.key});

  Widget _buildState(imagePath, stateHeader, stateCount) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  stateHeader,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('$stateCount',
                    style: const TextStyle(
                      fontSize: 24,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildTeacherWidget(BuildContext context) {
    return Row(
      children: [
        _buildState('assets/ic_idle.jpg', 'Idle', 16),
        _buildState('assets/ic_inapp.jpg', 'In-App', 3),
        _buildState('assets/ic_distracted.jpg', 'Distracted', 5),
      ],
    );
  }

  @override
  String headerTitle() {
    return 'State Tracker';
  }

  @override
  String headerInfo() {
    return 'Shows if students are idle, in-app, or distracted.';
  }
}
