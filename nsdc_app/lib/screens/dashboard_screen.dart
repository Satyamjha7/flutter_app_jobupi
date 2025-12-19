import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/nsdc_provider.dart';
import '../repositiories/student_repository.dart';
import 'student_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nsdcId = context.watch<NSDCProvider>().nsdcId!;
    final repo = context.read<StudentRepository>();
    final students = repo.getByNSDC(nsdcId);

    return Scaffold(
      appBar: AppBar(title: const Text("Student Dashboard")),
      body: students.isEmpty
          ? const Center(child: Text("No students registered"))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (_, i) {
                final s = students[i];
                return ListTile(
                  title: Text(s.fullName),
                  subtitle: Text(s.phoneNumber),
                  trailing: const Chip(
                    label: Text("Registered"),
                    backgroundColor: Colors.green,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentDetailScreen(student: s),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
