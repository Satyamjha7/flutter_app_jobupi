import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Flutter Developer"),
            subtitle: Text("TCS - Bangalore"),
          ),
          ListTile(
            title: Text("Backend Engineer"),
            subtitle: Text("Infosys - Pune"),
          ),
        ],
      ),
    );
  }
}
