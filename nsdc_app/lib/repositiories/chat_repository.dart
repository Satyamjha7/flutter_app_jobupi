import 'package:hive/hive.dart';
import '../models/chat_message.dart';

class ChatRepository {
  final Box<ChatMessage> box = Hive.box<ChatMessage>('messages');

  List<ChatMessage> getChat(String a, String b) {
    return box.values
        .where((m) => (m.from == a && m.to == b) || (m.from == b && m.to == a))
        .toList()
      ..sort((x, y) => x.timestamp.compareTo(y.timestamp));
  }

  void send(ChatMessage msg) {
    box.put(msg.messageId, msg);
  }
}
