import 'package:hive/hive.dart';
import '../models/student.dart';

class StudentRepository {
  final Box<Student> box = Hive.box<Student>('students');

  bool phoneExists(String phone) {
    return box.containsKey(phone);
  }

  void save(Student student) {
    box.put(student.phoneNumber, student);
  }

  Student? getCurrent() {
    return box.values.isNotEmpty ? box.values.first : null;
  }
}
