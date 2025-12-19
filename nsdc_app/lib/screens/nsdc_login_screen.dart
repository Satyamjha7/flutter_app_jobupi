import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/nsdc_provider.dart';
import 'dashboard_screen.dart';

class NSDCLoginScreen extends StatelessWidget {
  const NSDCLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NSDCProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("NSDC Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Select NSDC"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                provider.login("NSDC001");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
              child: const Text("Login as NSDC Delhi"),
            ),
          ],
        ),
      ),
    );
  }
}
