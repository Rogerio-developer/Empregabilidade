import 'dart:typed_data';
import 'package:empregabildade/components/animations/sad_emoji_animation.dart';
import 'package:empregabildade/components/pictures/picture_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/storage_pictures.dart';
import 'package:empregabildade/views/student/student_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class StudentPage extends StatefulWidget {
  StudentModel studentModel;

  StudentPage({super.key, required this.studentModel});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  StudentPageController controller = StudentPageController();
  Future<Uint8List?>? _gi;

  @override
  void initState() {
    super.initState();
    _gi = StoragePictures.getPicture(widget.studentModel.foto);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea21(
          titulo: 'Aluno',
          drawer: false,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PictureWidget(future: _gi, width: 150, height: 150)
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            widget.studentModel.nome,
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
                          child: Text(
                            widget.studentModel.curso,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
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
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: Tooltip(
                            message: 'Abrir WhatsApp',
                            child: TextButton.icon(
                              onPressed: () {
                                if (widget.studentModel.telefone.isNotEmpty) {
                                  controller.openWhatsApp(
                                      widget.studentModel.telefone);
                                } else {
                                  _alertStudentNullData();
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                              ),
                              label: Text(
                                widget.studentModel.telefone,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: Tooltip(
                            message: 'Abrir E-mail',
                            child: TextButton.icon(
                              onPressed: () {
                                if (widget.studentModel.email.isNotEmpty) {
                                  controller
                                      .openEmail(widget.studentModel.email);
                                } else {
                                  _alertStudentNullData();
                                }
                              },
                              icon: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              label: Text(
                                widget.studentModel.email,
                                overflow: TextOverflow.visible,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: Tooltip(
                            message: 'Abrir LinkedIn',
                            child: TextButton.icon(
                              onPressed: () {
                                if (widget.studentModel.linkedin.isNotEmpty) {
                                  controller.openLinkedin(
                                      widget.studentModel.linkedin);
                                } else {
                                  _alertStudentNullData();
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.blue,
                              ),
                              label: Text(
                                widget.studentModel.linkedin,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: Tooltip(
                            message: 'Abrir GitHub',
                            child: TextButton.icon(
                              onPressed: () {
                                if (widget.studentModel.git.isNotEmpty) {
                                  controller
                                      .openGitHub(widget.studentModel.git);
                                } else {
                                  _alertStudentNullData();
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.github,
                                color: Colors.black,
                              ),
                              label: Text(
                                widget.studentModel.git,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _alertStudentNullData() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: const [
            SizedBox(
              height: 100,
              width: 100,
              child: SadEmojiAnimation(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  'Infelizmente este aluno não cadastrou essa informação!',
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(shadowColor: const Color(0xff00d7f3)),
              child: const Text('OK')),
        ],
      ),
    );
  }
}
