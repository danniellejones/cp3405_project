import 'package:cp3405_project/models/student.dart';
import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  final Student? student;
  const AvatarScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationWidget(
      title: 'Avatar',
      content: [
        AvatarWidget(student: student),
      ],
    );
  }
}


