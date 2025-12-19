import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/student_provider.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = context.read<StudentProvider>().student!;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
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
                      me: student.phoneNumber,
                      peer: student.nsdcId,
                    ),
                  ),
                );
              },
              child: const Text("Chat with NSDC"),
            ),
          ],
        ),
      ),
    );
  }
}
