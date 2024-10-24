import 'package:mysql1/mysql1.dart';

class BD {
  MySqlConnection? _connection;

  Future<MySqlConnection> connect() async {
    if (_connection == null) {
      final sentting = ConnectionSettings(
          host: "127.0.0.1",
          port: 3306,
          user: "root",
          db: "easy-store");

      _connection = await MySqlConnection.connect(sentting);
    }

    return _connection!;
  }

  Future close() async {
    await _connection?.close();
    _connection = null;
  }
}