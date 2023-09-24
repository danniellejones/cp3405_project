import 'package:cp3405_project/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleWidget(
      isLoggedIn: false,
    );
  }
}
