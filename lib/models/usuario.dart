class Usuario {
  String nome, email, usuario, senha, bio;
  List<int> favoritos;

  Usuario({
    required this.nome,
    required this.email,
    required this.usuario,
    required this.senha,
    this.bio = 'Apaixonado(a) por cozinha caseira!',
    List<int>? favoritos,
  }) : favoritos = favoritos ?? [];

  Map<String, dynamic> toJson() => {
        'nome': nome, 'email': email, 'usuario': usuario,
        'senha': senha, 'bio': bio, 'favoritos': favoritos,
      };

  factory Usuario.fromJson(Map<String, dynamic> j) => Usuario(
        nome: j['nome'], email: j['email'], usuario: j['usuario'],
        senha: j['senha'], bio: j['bio'],
        favoritos: List<int>.from(j['favoritos'] ?? []),
      );
}
