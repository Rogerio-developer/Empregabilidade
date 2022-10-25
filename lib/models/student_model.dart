class StudentModel {
  late String id;
  late String nome;
  late String telefone;
  late String curso;
  late String email;
  late String linkedin;
  late String git;
  String? projeto;
  late bool disponivel;
  String? foto;
  bool favorito = false;

  StudentModel({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.curso,
    required this.email,
    required this.linkedin,
    required this.git,
    this.projeto,
    required this.disponivel,
    this.foto,
  });

  StudentModel.fromJson(Map map) {
    id = map['id'];
    nome = map['nome'];
    telefone = map['telefone'];
    curso = map['curso'];
    email = map['email'];
    linkedin = map['linkedin'];
    git = map['git'];
    projeto = map['projeto'];
    disponivel = map['disponivel'];
    if (map.containsKey("foto")) {
      foto = map["foto"];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'curso': curso,
      'email': email,
      'linkedin': linkedin,
      'git': git,
      'projeto': projeto,
      'disponivel': disponivel,
      'foto': foto,
    };
  }

  @override
  String toString() {
    return 'id: $id, nome: $nome, telefone: $telefone, curso: $curso,'
        'email: $email, linkedin: $linkedin, git: $git, disponivel: $disponivel';
  }
}
