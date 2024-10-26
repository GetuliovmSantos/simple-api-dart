import 'package:mysql1/mysql1.dart';

// Classe que gerencia a conexão com o banco de dados MySQL
class BD {
  // Variável para armazenar a conexão com o banco de dados
  MySqlConnection? _connection;

  // Método assíncrono para conectar ao banco de dados
  Future<MySqlConnection> connect() async {
    // Verifica se a conexão já não foi estabelecida
    if (_connection == null) {
      // Configurações da conexão com o banco de dados
      final settings = ConnectionSettings(
          host: "127.0.0.1", port: 3306, user: "root", db: "easy-store");
      try {
        // Tenta estabelecer a conexão com o banco de dados
        _connection = await MySqlConnection.connect(settings);
      } catch (e) {
        // Imprime o erro caso a conexão falhe
        print("Erro na Conexão, $e");
        // Relança a exceção para ser tratada em outro lugar
        rethrow;
      }
    }

    // Retorna a conexão estabelecida
    return _connection!;
  }

  // Método assíncrono para fechar a conexão com o banco de dados
  Future close() async {
    try {
      // Tenta fechar a conexão com o banco de dados
      await _connection?.close();
    } catch (e) {
      // Imprime o erro caso o fechamento da conexão falhe
      print("Erro ao fechar o banco de dados: $e");
    } finally {
      // Define a conexão como nula após o fechamento
      _connection = null;
    }
  }
}