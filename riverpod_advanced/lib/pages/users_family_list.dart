import 'package:flutter/material.dart';
import 'package:riverpod_advanced/pages/user_widget.dart';

class UsersFamilyList extends StatelessWidget {
  const UsersFamilyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List with Family Modifier'),
      ),
      body: const Column(
        children: [
          UserWidget(userId: 1),
          UserWidget(userId: 2),
          UserWidget(userId: 3),
        ],
      ),
    );
  }
}
