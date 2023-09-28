import 'package:flutter/material.dart';

abstract class TeacherLandingWidget extends StatelessWidget {
  const TeacherLandingWidget({super.key});

  Widget buildHeader() {
    return Row(
      children: [
        Text(
          headerTitle(),
          style: const TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tooltip(
            message: headerInfo(),
            child: const Icon(Icons.info_outline, color: Colors.blue),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildHeader(),
      Container(
        margin: const EdgeInsets.all(16.0),
        child: buildTeacherWidget(context),
      )
    ]);
  }

  Widget buildTeacherWidget(BuildContext context);

  String headerTitle();

  String headerInfo();
}
