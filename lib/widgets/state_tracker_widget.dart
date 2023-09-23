import 'package:flutter/material.dart';

class StateTrackerWidget extends StatelessWidget {
  const StateTrackerWidget({super.key});

  Widget _buildHeader(headerTitle, headerInfo) {
    return Row(
      children: [
        Text(
          headerTitle,
          style: const TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tooltip(
            message: headerInfo,
            child: const Icon(Icons.info_outline),
          ),
        )
      ],
    );
  }

  Widget _buildState(imagePath, stateHeader, stateCount) {
    return SizedBox(
      height: 100,
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
  Widget build(BuildContext context) {
    return Column(children: [
      _buildHeader(
        'State Tracker',
        'Shows if students are idle, in-app, or distracted.',
      ),
      Row(
        children: [
          _buildState('assets/ic_idle.jpg', 'Idle', 16),
          _buildState('assets/ic_inapp.jpg', 'In-App', 3),
          _buildState('assets/ic_distracted.jpg', 'Distracted', 5),
        ],
      ),
    ]);
  }
}
