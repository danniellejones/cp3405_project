import 'package:flutter/material.dart';

class StateTrackerWidget extends StatelessWidget {
  const StateTrackerWidget({super.key});

  Widget _buildState(imagePath, stateHeader, stateCount) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Image.asset(imagePath),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Idle',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('12',
                    style: TextStyle(
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
      Row(
        children: [
          const Text(
            'State Tracker',
            style: TextStyle(fontSize: 24),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
        ],
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
