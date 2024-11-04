import 'dart:convert';

// Classe que representa o modelo de um produto
class ProdutosModels {
  int? idProdutos; // ID do produto (opcional)
  String nomeProduto; // Nome do produto
  String tipoProduto; // Tipo do produto
  int quantidadeProduto; // Quantidade do produto

  // Construtor da classe ProdutosModels
  ProdutosModels({
    this.idProdutos,
    required this.nomeProduto,
    required this.tipoProduto,
    required this.quantidadeProduto,
  });

  // Converte o objeto ProdutosModels para um mapa
  Map<String, dynamic> toMap() {
    return {
      'idProdutos': idProdutos,
      'nomeProduto': nomeProduto,
      'tipoProduto': tipoProduto,
      'quantidadeProduto': quantidadeProduto,
    };
  }

  // Cria uma instância de ProdutosModels a partir de um mapa
  factory ProdutosModels.fromMap(Map<String, dynamic> map) {
    return ProdutosModels(
      idProdutos: map['idProdutos']?.toInt() ?? 0,
      nomeProduto: map['nomeProduto'] ?? '',
      tipoProduto: map['tipoProduto'] ?? '',
      quantidadeProduto: map['quantidadeProduto'] ?? '',
    );
  }

  // Converte o objeto ProdutosModels para uma string JSON
  String toJson() => json.encode(toMap());

  // Cria uma instância de ProdutosModels a partir de uma string JSON
  factory ProdutosModels.fromJson(String source) =>
      ProdutosModels.fromMap(json.decode(source));
}
