import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({super.key});

  @override
  State<PomodoroWidget> createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget> {
  static const maxSeconds = 10;
  static const maxHearts = 5;
  Timer? timer;

  int seconds = maxSeconds;
  int hearts = maxHearts;

  double percentage = 1;

  void resetTimer() {
    seconds = maxSeconds;
    percentage = 1;
  }

  void calculatePercentage() {
    percentage = (maxSeconds - seconds) / maxSeconds * 1;
  }

  void addHeart() {
    setState(() => hearts++);
  }

  void removeHeart() {
    setState(() => hearts--);
  }

  void startTimer() {
    if (hearts < maxHearts) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() => {
              seconds--,
              calculatePercentage(),
              if (seconds < 0 && hearts < maxHearts)
                {
                  addHeart(),
                  resetTimer(),
                },
              if (hearts == maxHearts) {seconds = 0, timer?.cancel()}
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: startTimer, child: const Text('Start')),
              ElevatedButton(onPressed: resetTimer, child: const Text('Reset')),
              ElevatedButton(
                  onPressed: removeHeart, child: const Text('Remove')),
            ],
          ),
          CircularPercentIndicator(
            percent: percentage,
            animation: true,
            animateFromLastPercent: true,
            lineWidth: 20.0,
            radius: 100.0,
            center: Text(
              "$seconds",
              style: const TextStyle(fontSize: 40),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: GridView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: maxHearts,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0),
                  itemCount: hearts,
                  itemBuilder: (BuildContext context, index) {
                    return const Icon(Icons.heart_broken);
                  }),
            ),
          ),
          const Text(
            'Greyscale Meter',
            style: TextStyle(fontSize: 24),
          ),
          const Text('Your phone must be idle to restore health!'),
        ],
      ),
    );
  }
}
