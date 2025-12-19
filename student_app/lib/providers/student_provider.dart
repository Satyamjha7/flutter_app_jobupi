import 'package:flutter/material.dart';
import '../models/student.dart';
import '../repositories/student_repository.dart';

class StudentProvider extends ChangeNotifier {
  final StudentRepository repo;
  Student? student;

  StudentProvider(this.repo);

  bool register(Student s) {
    if (repo.phoneExists(s.phoneNumber)) return false;
    repo.save(s);
    student = s;
    notifyListeners();
    return true;
  }
}
