import 'package:empregabildade/components/animations/project_animation.dart';
import 'package:empregabildade/models/project_model.dart';
import 'package:empregabildade/views/project/project_page.dart';
import 'package:flutter/material.dart';

class ProjecCardtWidget extends StatelessWidget {
  final ProjectModel projectModel;
  final Function(ProjectModel)? onClickFavorite;

  const ProjecCardtWidget({
    super.key,
    required this.projectModel,
    this.onClickFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectPage(
              projectModel: projectModel,
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
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ProjectAnimation(),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 3,
                child: Tooltip(
                  message: 'Informações sobre o projeto',
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
                              projectModel.nome,
                              overflow: TextOverflow.visible,
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
                              projectModel.curso,
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
              if (onClickFavorite != null)
                Tooltip(
                  message: 'Favoritar',
                  child: IconButton(
                    onPressed: () {
                      onClickFavorite!(projectModel);
                    },
                    icon: projectModel.favorito
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
