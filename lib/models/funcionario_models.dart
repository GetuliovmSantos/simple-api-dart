import 'dart:convert';

class FuncionarioModels {
  int? matriculaFuncionario;
  String nomeFuncionario;
  String senhaFuncionario;
  String funcaoFuncionario;
  FuncionarioModels({
    this.matriculaFuncionario,
    required this.nomeFuncionario,
    required this.senhaFuncionario,
    required this.funcaoFuncionario,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'matriculaFuncionario': matriculaFuncionario,
      'nomeFuncionario': nomeFuncionario,
      'senhaFuncionario': senhaFuncionario,
      'funcaoFuncionario': funcaoFuncionario,
    };
  }

  factory FuncionarioModels.fromMap(Map<String, dynamic> map) {
    return FuncionarioModels(
      matriculaFuncionario: map['matriculaFuncionario']?.toInt() ?? 0,
      nomeFuncionario: map['nomeFuncionario'] ?? '',
      senhaFuncionario: map['senhaFuncionario'] ?? '',
      funcaoFuncionario: map['funcaoFuncionario'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FuncionarioModels.fromJson(String source) => FuncionarioModels.fromMap(json.decode(source));
}
