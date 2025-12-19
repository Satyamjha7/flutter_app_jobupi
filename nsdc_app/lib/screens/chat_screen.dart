import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../providers/chat_provider.dart';
import '../models/chat_message.dart';

class ChatScreen extends StatelessWidget {
  final String me;
  final String peer;

  const ChatScreen({super.key, required this.me, required this.peer});

  @override
  Widget build(BuildContext context) {
    final chat = context.watch<ChatProvider>();
    final controller = TextEditingController();
    final messages = chat.messages(me, peer);

    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, i) {
                final m = messages[i];
                return Align(
                  alignment: m.from == me
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: m.from == me ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      m.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(child: TextField(controller: controller)),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  chat.send(
                    ChatMessage(
                      messageId: const Uuid().v4(),
                      from: me,
                      to: peer,
                      text: controller.text,
                      timestamp: DateTime.now(),
                    ),
                  );
                  controller.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
