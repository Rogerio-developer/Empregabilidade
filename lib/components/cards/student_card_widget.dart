import 'package:empregabildade/components/pictures/picture_widget.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:empregabildade/repository/storage_pictures.dart';
import 'package:empregabildade/views/student/student_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudentCardWidget extends StatefulWidget {
  final StudentModel studentModel;
  final Function(StudentModel)? onClickFavorite;

  const StudentCardWidget({
    super.key,
    required this.studentModel,
    this.onClickFavorite,
  });

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  Future<Uint8List?>? future;

  @override
  void initState() {
    super.initState();
    future = StoragePictures.getPicture(widget.studentModel.foto!);
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
    return InkWell(
      onTap: () {
        Tooltip.dismissAllToolTips();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentPage(
              studentModel: widget.studentModel,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(59, 57, 138, 1),
                Color.fromRGBO(37, 155, 143, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PictureWidget(future: future, width: 80, height: 80)
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Tooltip(
                  message: 'Informações sobre o aluno',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: const Text(
                              'Nome:',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              widget.studentModel.nome,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: const Text(
                              'Curso:',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              widget.studentModel.curso,
                              style: const TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Favoritar',
                onPressed: () {
                  _onClickFavorite(widget.studentModel);
                },
                icon: widget.studentModel.favorito
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
