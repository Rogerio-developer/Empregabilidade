import 'package:empregabildade/components/animations/favorite_widget.dart';
import 'package:empregabildade/components/cards/project_card_widget.dart';
import 'package:empregabildade/components/cards/student_card_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/components/text/text_widget.dart';
import 'package:empregabildade/models/project_model.dart';
import 'package:empregabildade/models/student_model.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<ProjectModel> _favoriteProjectList = [];
  List<StudentModel> _favoriteStudentList = [];
  final List _favoriteList = [];

  @override
  void initState() {
    LocalData localData = LocalData.instance;
    _favoriteProjectList = localData.listOfFavoriteProjects;
    _favoriteStudentList = localData.listOfFavoriteStudents;
    for (var element in _favoriteProjectList) {
      _favoriteList.add(element);
    }
    for (var element in _favoriteStudentList) {
      _favoriteList.add(element);
    }
    super.initState();
  }

  Widget _selectedFavorits(item) {
    if (item is ProjectModel) {
      return ProjecCardtWidget(projectModel: item);
    } else {
      return StudentCardWidget(studentModel: item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea21(
      titulo: 'Favoritos',
      body: (_favoriteList.isEmpty)
          ? Stack(
              children: const [
                FavoriteWidget(),
                Center(
                  child: TextTituloWidget(
                      text:
                          'Você ainda nao possui favoritos. Volte a tela de projetos'
                          ' ou alunos, e clique no coração para favoritar'),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _favoriteList.length,
                    itemBuilder: (context, index) {
                      return _selectedFavorits(_favoriteList[index]);
                    },
                  ),
                )
              ],
            ),
    );
  }
}
