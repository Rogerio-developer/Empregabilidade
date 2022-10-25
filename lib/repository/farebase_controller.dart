import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empregabildade/models/project_model.dart';
import 'package:empregabildade/models/student_model.dart';

class FireBaseController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<StudentModel>> selectAllStudents() async {
    List<StudentModel> students = [];
    var collection = await db.collection('Alunos').get();
    for (var doc in collection.docs) {
      var data = doc.data();
      data["id"] = doc.id;
      students.add(
        StudentModel.fromJson(data),
      );
    }
    return students;
  }

  Future<List<ProjectModel>> selectAllProjects() async {
    List<ProjectModel> projects = [];
    var collection = await db.collection('Projetos').get();
    for (var doc in collection.docs) {
      var data = doc.data();
      data["id"] = doc.id;
      projects.add(
        ProjectModel.fromJson(data),
      );
    }
    return projects;
  }
}
