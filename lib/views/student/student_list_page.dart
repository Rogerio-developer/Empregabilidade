import 'package:empregabildade/components/cards/student_card_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<StudentModel> _listStudent = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    LocalData ld = LocalData.instance;
    _listStudent = ld.studentList;

    _controller.addListener(() {
      _controller.offset / 0;
      setState(() {});
    });
    super.initState();
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
    return SafeArea21(
      titulo: 'Lista de Alunos',
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            controller: _controller,
            itemCount: _listStudent.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              double scale = 1.0;
              if (_controller.offset / 119 > 0.5) {
                scale = index + 0.5 - _controller.offset / 119;
                if (scale < 0) {
                  scale = 0;
                } else if (scale > 1) {
                  scale = 1;
                }
              }
              return Opacity(
                opacity: scale,
                child: Transform(
                  transform: Matrix4.identity()..scale(scale, scale),
                  alignment: Alignment.topLeft,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: StudentCardWidget(
                        studentModel: _listStudent[index],
                        onClickFavorite: _onClickFavorite),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
