import 'package:empregabildade/components/cards/developer_card_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/components/text/text_widget.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<StudentModel> _listStudent = [];
  ScrollController controller = ScrollController();

  @override
  void initState() {
    LocalData localData = LocalData.instance;
    for (var element in localData.studentList) {
      if (element.projeto == "Empregabilidade Entra21") {
        _listStudent.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea21(
      titulo: "SOBRE O APLICATIVO",
      drawer: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DESENVOLVEDORES",
                    style: GoogleFonts.arsenal(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: _listStudent.length,
                      itemBuilder: (context, index) {
                        return DeveloperCardWidget(
                          studentModel: _listStudent[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextTituloWidget(text: 'OBJETIVO'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextTituloWidget(
                text:
                    'O App tem como objetivo auxiliar na divulgação dos alunos'
                    ' do programa Entra21 junto as empresas de tecnologia'
                    ' fazendo uma ponte entre a empresa e o aluno.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextTituloWidget(text: 'TECNOLOGIAS UTILIZADAS'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 350,
                    child: Image.asset('images/flutter.png'),
                  ),
                ),
              ],
            ),
            Image.asset('images/firebase.png'),
          ],
        ),
      ),
    );
  }
}
