import 'package:cp3405_project/widgets/teacher_landing/teacher_landing_widget.dart';
import 'package:flutter/material.dart';

class SetQuestionWidget extends TeacherLandingWidget {
  const SetQuestionWidget({super.key});

  @override
  Widget buildTeacherWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add a Question",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Question?",
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: const Text("Reset"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: const Text("Post"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(100, 40)),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Number",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: const Text("Remove Response"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: const Text("Clear All"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  String headerTitle() {
    return 'Set Class Board Question';
  }

  @override
  String headerInfo() {
    return 'Do the thing';
  }
}
