import 'dart:convert';

// Classe que representa o modelo de um funcionário
class FuncionarioModels {
  int? matriculaFuncionario; // Matrícula do funcionário (opcional)
  String nomeFuncionario; // Nome do funcionário
  String senhaFuncionario; // Senha do funcionário
  String funcaoFuncionario; // Função do funcionário

  // Construtor da classe FuncionarioModels
  FuncionarioModels({
    this.matriculaFuncionario,
    required this.nomeFuncionario,
    required this.senhaFuncionario,
    required this.funcaoFuncionario,
  });

  // Converte o objeto FuncionarioModels para um mapa
  Map<String, dynamic> toMap() {
    return {
      'matriculaFuncionario': matriculaFuncionario,
      'nomeFuncionario': nomeFuncionario,
      'senhaFuncionario': senhaFuncionario,
      'funcaoFuncionario': funcaoFuncionario,
    };
  }

  // Cria uma instância de FuncionarioModels a partir de um mapa
  factory FuncionarioModels.fromMap(Map<String, dynamic> map) {
    return FuncionarioModels(
      matriculaFuncionario: map['matriculaFuncionario']?.toInt() ?? 0,
      nomeFuncionario: map['nomeFuncionario'] ?? '',
      senhaFuncionario: map['senhaFuncionario'] ?? '',
      funcaoFuncionario: map['funcaoFuncionario'] ?? '',
    );
  }

  // Converte o objeto FuncionarioModels para uma string JSON
  String toJson() => json.encode(toMap());

  // Cria uma instância de FuncionarioModels a partir de uma string JSON
  factory FuncionarioModels.fromJson(String source) =>
      FuncionarioModels.fromMap(json.decode(source));
}
