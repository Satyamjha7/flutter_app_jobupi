import 'package:flutter/material.dart';
import '../models/student.dart';
import 'chat_screen.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${student.fullName}"),
            Text("Phone: ${student.phoneNumber}"),
            Text("NSDC: ${student.nsdcId}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      me: student.nsdcId,
                      peer: student.phoneNumber,
                    ),
                  ),
                );
              },
              child: const Text("Chat with Student"),
            ),
          ],
        ),
      ),
    );
  }
}
