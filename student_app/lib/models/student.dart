import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String studentId;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String nsdcId;

  @HiveField(4)
  DateTime registeredAt;

  Student({
    required this.studentId,
    required this.fullName,
    required this.phoneNumber,
    required this.nsdcId,
    required this.registeredAt,
  });
}
