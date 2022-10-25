import 'package:empregabildade/components/cards/student_card_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/components/text/text_widget.dart';
import 'package:empregabildade/models/project_model.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProjectPage extends StatefulWidget {
  ProjectModel projectModel;

  ProjectPage({
    super.key,
    required this.projectModel,
  });

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<StudentModel> listStudentModel = [];
  final ScrollController _controller = ScrollController();

  @override
  initState() {
    LocalData localData = LocalData.instance;

    listStudentModel = localData.studentList.cast<StudentModel>();

    super.initState();
  }

  List<StudentModel> listStudent() {
    List<StudentModel> listStudentProject = [];
    for (var student in listStudentModel) {
      if (student.projeto == widget.projectModel.nome) {
        listStudentProject.add(student);
      }
    }
    return listStudentProject;
  }

  _onClickFavorite(StudentModel studentModel) {
    LocalData ld = LocalData.instance;
    studentModel.favorito = !studentModel.favorito;
    if (studentModel.favorito) {
      ld.addStudentFavorite(studentModel);
    } else {
      ld.delStudentFavorite(studentModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea21(
          drawer: false,
          titulo: 'Projeto',
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.projectModel.nome,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            letterSpacing: 3,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const TextTituloWidget(
                          text: 'DESCRIÇÃO',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.projectModel.descricao,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const TextTituloWidget(text: 'CURSO'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.projectModel.curso,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const TextTituloWidget(text: 'EQUIPE'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    controller: _controller,
                    padding: const EdgeInsets.all(8),
                    itemCount: listStudent().length,
                    itemBuilder: (context, index) {
                      return StudentCardWidget(
                        studentModel: listStudent()[index],
                        onClickFavorite: _onClickFavorite,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
