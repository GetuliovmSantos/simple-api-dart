import 'dart:convert';

// Classe que representa o modelo de uma venda
class VendasModels {
  int? idVendas; // ID da venda (opcional)
  int quantidadeVenda; // Quantidade vendida
  DateTime dataVenda; // Data da venda
  int idFuncionarios; // ID do funcionário que realizou a venda
  int idProdutos; // ID do produto vendido

  // Construtor da classe VendasModels
  VendasModels({
    this.idVendas,
    required this.quantidadeVenda,
    required this.dataVenda,
    required this.idFuncionarios,
    required this.idProdutos,
  });

  // Converte o objeto VendasModels para um mapa
  Map<String, dynamic> toMap() {
    return {
      'idVendas': idVendas,
      'quantidadeVenda': quantidadeVenda,
      'dataVenda': dataVenda.millisecondsSinceEpoch,
      'idFuncionarios': idFuncionarios,
      'idProdutos': idProdutos,
    };
  }

  // Cria uma instância de VendasModels a partir de um mapa
  factory VendasModels.fromMap(Map<String, dynamic> map) {
    return VendasModels(
      idVendas: map['idVendas']?.toInt() ?? 0,
      quantidadeVenda: map['quantidadeVenda']?.toInt() ?? 0,
      dataVenda: DateTime.fromMillisecondsSinceEpoch(map['dataVenda']),
      idFuncionarios: map['idFuncionarios']?.toInt() ?? 0,
      idProdutos: map['idProdutos']?.toInt() ?? 0,
    );
  }

  // Converte o objeto VendasModels para uma string JSON
  String toJson() => json.encode(toMap());

  // Cria uma instância de VendasModels a partir de uma string JSON
  factory VendasModels.fromJson(String source) =>
      VendasModels.fromMap(json.decode(source));
}
