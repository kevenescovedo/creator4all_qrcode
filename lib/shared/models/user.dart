import 'dart:convert';

class User {
  final String usuario;
  final String senha;
  final String token;
  final String nome;
  final String foto;
  final bool compartilhar;
  final bool publicar;
  final String id;

  User({
    this.usuario,
    this.senha,
    this.compartilhar,
    this.foto,
    this.id,
    this.nome,
    this.publicar,
    this.token,
  });

  User copyWith(
      {String usuario,
      String senha,
      String nome,
      String foto,
      bool compartilhar,
      bool publicar,
      String id,
      String token}) {
    return User(
      usuario: usuario ?? this.usuario,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      foto: foto ?? this.foto,
      compartilhar: compartilhar ?? this.compartilhar,
      publicar: publicar ?? this.publicar,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'usuario': usuario,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      usuario: map['usuario'],
      senha: map['senha'],
      nome: map['nome'],
      foto: map['foto'],
      compartilhar: map['compartilhar'],
      publicar: map['publicar'],
      id: map['id'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $usuario, password: $senha)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.usuario == usuario &&
        other.senha == senha &&
        other.id == id &&
        other.nome == nome &&
        other.foto == foto &&
        other.publicar == publicar &&
        other.compartilhar == compartilhar &&
        other.token == token;
    ;
  }

  @override
  int get hashCode {
    return usuario.hashCode ^
        senha.hashCode ^
        nome.hashCode ^
        id.hashCode ^
        foto.hashCode ^
        publicar.hashCode ^
        compartilhar.hashCode ^
        token.hashCode;
  }
}
