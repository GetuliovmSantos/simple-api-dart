import '../database/bd.dart';
import '../models/funcionario_models.dart';

class FuncionarioRepository {
  final BD _db = BD();

  Future<List<FuncionarioModels>> getAllFuncionarios() async {
    final connection = await _db.connect();
    final result = await connection.query('SELECT * FROM funcionario;');

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

  Future<void> addFuncionario(FuncionarioModels funcionario) async {
    final connection = await _db.connect();
    await connection.query(
        'insert into funcionario (nomeFuncionario, senhaFuncionario, funcaoFuncionario) values (?, ?, ?);',
        [
          funcionario.nomeFuncionario,
          funcionario.senhaFuncionario,
          funcionario.funcaoFuncionario
        ]);

    _db.close();
  }

  Future<void> deleteFuncionario(int matricula) async {
    final connection = await _db.connect();
    await connection.query(
        'delete from funcionario where matriculaFuncionario = ?;', [matricula]);

    _db.close();
  }
}