import 'package:empregabildade/components/cards/project_card_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:empregabildade/models/project_model.dart';
import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<ProjectModel> _projectList = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    LocalData ld = LocalData.instance;
    _projectList = ld.projectList;

    _controller.addListener(() {
      _controller.offset / 0;
      setState(() {});
    });
    super.initState();
  }

  _onClickFavorite(ProjectModel projectModel) {
    LocalData ld = LocalData.instance;
    projectModel.favorito = !projectModel.favorito;
    if (projectModel.favorito) {
      ld.addProjectFavorite(projectModel);
    } else {
      ld.delProjectFavorite(projectModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea21(
      titulo: 'Lista de Projetos ',
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            controller: _controller,
            itemCount: _projectList.length,
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
                    child: ProjecCardtWidget(
                        projectModel: _projectList[index],
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
