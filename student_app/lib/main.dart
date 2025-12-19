import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/student.dart';
import 'models/chat_message.dart';
import 'repositories/student_repository.dart';
import 'repositories/chat_repository.dart';
import 'providers/student_provider.dart';
import 'providers/chat_provider.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(ChatMessageAdapter());

  await Hive.openBox<Student>('students');
  await Hive.openBox<ChatMessage>('messages');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentProvider(StudentRepository()),
        ),
        ChangeNotifierProvider(create: (_) => ChatProvider(ChatRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RegisterScreen(),
      ),
    );
  }
}
