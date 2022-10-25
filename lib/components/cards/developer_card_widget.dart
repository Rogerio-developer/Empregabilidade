import 'package:empregabildade/components/animations/info_widget.dart';
import 'package:empregabildade/components/pictures/picture_widget.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/storage_pictures.dart';
import 'package:empregabildade/views/student/student_page.dart';
import 'package:flutter/material.dart';

class DeveloperCardWidget extends StatelessWidget {
  final StudentModel studentModel;
  const DeveloperCardWidget({
    super.key,
    required this.studentModel,
  });

  String information(StudentModel studentModel) {
    String funcao = '';

    if (studentModel.nome.contains('Rogerio')) {
      funcao = 'Desenvolvimento das estrutura MVC do código.\n\n'
          'Desenvolvimento dos códigos, logicas, e regras de negócio.\n\n'
          'Auxilio no Desenvolvimento do Banco de Dados\n\n'
          'Desenvolvimento do consumo de Banco de Dados.\n\n'
          'Desenvolvimento de Telas do Projeto.\n\n'
          'Desenvolvimento do Design.\n';
      'Auxilio na idealização de funcionalidades.\n';
    }
    if (studentModel.nome.contains('Ricardo')) {
      funcao = 'Idealizador do Projeto.\n\n'
          'Auxiliou na construção de telas do projeto.\n\n'
          'Cadastro e Organização de Banco de Dados.\n\n'
          'Auxiliou no desenvolvimento do design.\n';
    }
    if (studentModel.nome.contains('Cíntia')) {
      funcao = 'Auxiliou no desenvolvimento do design.\n\n'
          'Apresentação.\n\n';
      'Auxilio na idealização de funcionalidades.\n';
    }
    if (studentModel.nome.contains('Victor')) {
      funcao = 'Auxiliou no desenvolvimento das Telas do projeto.\n\n'
          'Auxiliou na Implementação de Códigos.\n\n'
          'Auxiliou no desenvolvimento do design.\n\n';
      'Auxilio na idealização de funcionalidades.\n';
    }
    return funcao;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(59, 57, 138, 1),
              Color.fromRGBO(37, 155, 143, 1),
            ],
          ),
        ),
        width: 200,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PictureWidget(
                    future: StoragePictures.getPicture(studentModel.foto!),
                    width: 120,
                    height: 120),
                IconButton(
                  iconSize: 40,
                  tooltip: 'Informações sobre o aluno',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentPage(
                          studentModel: studentModel,
                        ),
                      ),
                    );
                  },
                  icon: const InfoWidget(),
                )
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    information(studentModel),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
