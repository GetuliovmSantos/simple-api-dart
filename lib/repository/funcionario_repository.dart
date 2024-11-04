import '../database/bd.dart';
import '../models/funcionario_models.dart';

// Classe responsável pelo repositório de funcionários
class FuncionarioRepository {
  // Instância do banco de dados
  final BD _db = BD();

  // Método para adicionar um novo funcionário
  Future<void> addFuncionario(FuncionarioModels funcionario) async {
    final connection = await _db.connect();
    // Query para inserir um novo funcionário na tabela 'funcionarios'
    await connection.query("""
        insert into funcionarios (nomeFuncionario, senhaFuncionario, funcaoFuncionario) 
        values (?, ?, ?);
      """, [
      funcionario.nomeFuncionario,
      funcionario.senhaFuncionario,
      funcionario.funcaoFuncionario
    ]);
    _db.close();
  }

  // Método para obter todos os funcionários
  Future<List<FuncionarioModels>> getAllFuncionarios() async {
    final connection = await _db.connect();
    // Query para selecionar todos os registros da tabela 'funcionarios'
    final result = await connection.query('SELECT * FROM funcionarios;');

    // Mapeia o resultado da query para uma lista de objetos FuncionarioModels
    final funcionarios = result
        .map((e) => FuncionarioModels(
            matriculaFuncionario: e['matriculaFuncionario'],
            nomeFuncionario: e['nomeFuncionario'],
            senhaFuncionario: e['senhaFuncionario'],
            funcaoFuncionario: e['funcaoFuncionario']))
        .toList();

    _db.close();
    return funcionarios;
  }

  // Método para obter um funcionário específico pelo número de matrícula
  Future<FuncionarioModels> getOneFuncionario(int matricula) async {
    final connection = await _db.connect();
    // Query para selecionar um funcionário específico pelo número de matrícula
    final result = await connection.query("""
        select * from funcionarios 
        where matriculaFuncionario = ?
      """, [matricula]);

    // Mapeia o resultado da query para um objeto FuncionarioModels
    final funcionario = result
        .map((e) => FuncionarioModels(
            matriculaFuncionario: e["matriculaFuncionario"],
            nomeFuncionario: e["nomeFuncionario"],
            senhaFuncionario: e["senhaFuncionario"],
            funcaoFuncionario: e["funcaoFuncionario"]))
        .first;

    _db.close();
    return funcionario;
  }

  // Método para deletar um funcionário pelo número de matrícula
  Future<void> deleteFuncionario(int matricula) async {
    final connection = await _db.connect();
    // Query para deletar um funcionário específico pelo número de matrícula
    await connection.query("""
        delete from funcionarios 
        where matriculaFuncionario = ?;
      """, [matricula]);
    _db.close();
  }

  // Método para atualizar os dados de um funcionário
  Future<void> updateFuncionario(
      FuncionarioModels funcionario, int matricula) async {
    final connection = await _db.connect();
    // Query para atualizar os dados de um funcionário específico
    await connection.query("""
        update funcionarios 
        set nomeFuncionario = ?, 
          senhaFuncionario = ?, 
          funcaoFuncionario = ? 
        where matriculaFuncionario = ?
      """, [
      funcionario.nomeFuncionario,
      funcionario.senhaFuncionario,
      funcionario.funcaoFuncionario,
      matricula
    ]);
    _db.close();
  }
}
