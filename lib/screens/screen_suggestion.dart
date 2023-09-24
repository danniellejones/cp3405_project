import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/suggestion_widget.dart';
import 'package:flutter/material.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Login',
      content: [
        SuggestionWidget(),
      ],
    );
  }
}
