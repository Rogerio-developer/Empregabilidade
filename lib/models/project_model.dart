class ProjectModel {
  late String id;
  late String nome;
  late String descricao;
  late String curso;
  bool favorito = false;

  ProjectModel(
    this.id,
    this.nome,
    this.descricao,
    this.curso,
  );

  ProjectModel.fromJson(Map map) {
    id = map["id"];
    nome = map['nome'];
    descricao = map['descricao'];
    curso = map['curso'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'curso': curso,
    };
  }

  @override
  String toString() {
    return '$nome, $descricao, $curso';
  }
}
