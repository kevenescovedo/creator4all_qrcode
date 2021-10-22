import 'dart:convert';

import 'package:creator4all_qrocde/shared/models/aluno.dart';
import 'package:creator4all_qrocde/shared/models/periodo.dart';
import 'package:creator4all_qrocde/shared/models/rede.dart';

class Turma {
  final String id;
  final String codigo;
  final String nome;
  final String classe;
  final String anoLetivo;
  final Map<String, dynamic> rede;
  final List<dynamic> alunos;
  final Map<String, dynamic> periodo;

  Turma({
    this.id,
    this.codigo,
    this.nome,
    this.classe,
    this.anoLetivo,
    this.rede,
    this.alunos,
    this.periodo,
  });

  Turma copyWith({
    String id,
    String codigo,
    String nome,
    String classe,
    String anoLetivo,
    Map<String, dynamic> rede,
    List<Map<String, dynamic>> alunos,
    Map<String, dynamic> periodo,
  }) {
    return Turma(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        nome: nome ?? this.nome,
        classe: classe ?? this.classe,
        anoLetivo: anoLetivo ?? this.anoLetivo,
        rede: rede ?? this.rede,
        alunos: alunos ?? this.alunos,
        periodo: periodo ?? this.periodo);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'classe': classe,
      'rede': rede,
      'alunos': alunos,
      'periodo': periodo,
    };
  }

  factory Turma.fromMap(Map<String, dynamic> map) {
    return Turma(
        id: map["id"],
        codigo: map['codigo'],
        nome: map['nome'],
        classe: map['classe'],
        rede: map['rede'] ?? {},
        alunos: map['alunos'],
        periodo: map['periodo'],
        anoLetivo: map['anoLetivo']);
  }

  String toJson() => json.encode(toMap());

  factory Turma.fromJson(String source) => Turma.fromMap(json.decode(source));

  @override
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Turma &&
        other.id == id &&
        other.codigo == codigo &&
        other.nome == nome &&
        other.classe == classe &&
        other.rede == rede &&
        other.alunos == alunos &&
        other.periodo == periodo;
    ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        codigo.hashCode ^
        nome.hashCode ^
        classe.hashCode ^
        rede.hashCode ^
        alunos.hashCode ^
        periodo.hashCode;
  }
}
