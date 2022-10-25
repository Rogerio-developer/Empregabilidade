import 'dart:convert';
import 'package:empregabildade/models/project_model.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final LocalData _instance = LocalData._privateConstructor();

  LocalData._privateConstructor();

  static get instance => _instance;

  List<ProjectModel> projectList = [];
  List<StudentModel> studentList = [];

  List<ProjectModel> listOfFavoriteProjects = [];
  List<StudentModel> listOfFavoriteStudents = [];

  addProjectFavorite(ProjectModel projectModel) {
    listOfFavoriteProjects.add(projectModel);
    _saveProjectsFavorite();
  }

  delProjectFavorite(ProjectModel projectModel) {
    listOfFavoriteProjects.remove(projectModel);
    _saveProjectsFavorite();
  }

  addStudentFavorite(StudentModel studentModel) {
    listOfFavoriteStudents.add(studentModel);
    _saveStudentFavorite();
  }

  delStudentFavorite(StudentModel studentModel) {
    listOfFavoriteStudents.remove(studentModel);
    _saveStudentFavorite();
  }

  _saveProjectsFavorite() async {
    var array = [];
    for (var element in listOfFavoriteProjects) {
      array.add(
        element.toJson(),
      );
    }
    var json = jsonEncode(array);
    var sp = await SharedPreferences.getInstance();
    sp.setString("projects_fav", json);
  }

  loadProjectsFavorite() async {
    List<ProjectModel> array = [];
    var sp = await SharedPreferences.getInstance();
    var str = sp.getString("projects_favorites");
    var json = jsonDecode(str!);
    json.forEach(
      (element) {
        array.add(
          ProjectModel.fromJson(element),
        );
      },
    );
    listOfFavoriteProjects = array;
  }

  _saveStudentFavorite() async {
    var array = [];
    for (var element in listOfFavoriteStudents) {
      array.add(
        element.toJson(),
      );
    }
    var json = jsonEncode(array);
    var sp = await SharedPreferences.getInstance();
    sp.setString("student_favorites", json);
  }

  loadStudentFavorite() async {
    List<StudentModel> array = [];
    var sp = await SharedPreferences.getInstance();
    var str = sp.getString("student_favorites");
    var json = jsonDecode(str!);
    json.forEach(
      (element) {
        array.add(
          StudentModel.fromJson(element),
        );
      },
    );
    listOfFavoriteStudents = array;
  }
}
