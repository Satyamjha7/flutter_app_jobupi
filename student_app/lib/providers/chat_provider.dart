import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../repositories/chat_repository.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepository repo;

  ChatProvider(this.repo);

  List<ChatMessage> messages(String a, String b) {
    return repo.getChat(a, b);
  }

  void send(ChatMessage msg) {
    repo.send(msg);
    notifyListeners();
  }
}
