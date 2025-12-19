import 'package:hive/hive.dart';
part 'chat_message.g.dart';

@HiveType(typeId: 1)
class ChatMessage {
  @HiveField(0)
  String messageId;

  @HiveField(1)
  String from;

  @HiveField(2)
  String to;

  @HiveField(3)
  String text;

  @HiveField(4)
  DateTime timestamp;

  ChatMessage({
    required this.messageId,
    required this.from,
    required this.to,
    required this.text,
    required this.timestamp,
  });
}
