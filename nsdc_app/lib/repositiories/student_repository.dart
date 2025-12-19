import 'package:hive/hive.dart';
import '../models/student.dart';

class StudentRepository {
  final Box<Student> box = Hive.box<Student>('students');

  /// Check if phone already exists
  bool phoneExists(String phone) {
    return box.containsKey(phone);
  }

  /// Save student (phoneNumber is key)
  void save(Student student) {
    box.put(student.phoneNumber, student);
  }

  /// Get all students linked to an NSDC
  List<Student> getByNSDC(String nsdcId) {
    return box.values.where((s) => s.nsdcId == nsdcId).toList();
  }

  /// Get student by phone
  Student? getByPhone(String phone) {
    return box.get(phone);
  }
}
