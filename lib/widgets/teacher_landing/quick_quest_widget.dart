import 'package:cp3405_project/widgets/teacher_landing/teacher_landing_widget.dart';
import 'package:flutter/material.dart';

class QuickQuestWidget extends TeacherLandingWidget {
  const QuickQuestWidget({super.key});

  @override
  Widget buildTeacherWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Quest Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<String>(
                items: ['1', '2', '3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  //todo
                },
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Points",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(100, 40)),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Duration",
              hintText: "Minutes",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          maxLines: null,
          decoration: const InputDecoration(
            hintText: "Description",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // clear logic
              },
              child: const Text("Clear"),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // create klogic
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  String headerTitle() {
    return 'Quick Create Quest';
  }

  @override
  String headerInfo() {
    return 'Create a quest, quickly.';
  }
}
