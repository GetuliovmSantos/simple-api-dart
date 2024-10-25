import 'package:shelf/shelf.dart';
import 'package:simple_api_dart/models/funcionario_models.dart';
import 'package:simple_api_dart/repository/funcionario_repository.dart';
import 'package:simple_api_dart/views/json_view.dart';

class FuncionarioController {
  final FuncionarioRepository _funcionarioRepository = FuncionarioRepository();

  Future<Response> getFuncionarios(Request request) async{
    try {
      final funcionarios = await _funcionarioRepository.getAllFuncionarios();
      return JsonView.render({"funcionarios": funcionarios.map((funcionario) => funcionario.toMap()).toList()});
    } catch (e) {
      return JsonView.renderError("Erro ao buscar funcionários");
    }
  }

  Future<Response> addFuncionario(Request request) async {
    try {
      final body = await request.readAsString();
      final funcionario = FuncionarioModels.fromJson(body);
      await _funcionarioRepository.addFuncionario(funcionario);
      return JsonView.render({"message": "Funcionário adicionado com sucesso"});
    } catch (e) {
      return JsonView.renderError("Erro ao adicionar funcionário");
    }
  }

  Future<Response> deleteFuncionario(Request request, String matricula) async {
    try {
      await _funcionarioRepository.deleteFuncionario(int.parse(matricula));
      return JsonView.render({"message": "Funcionário deletado com sucesso"});
    } catch (e) {
      return JsonView.renderError("Erro ao deletar funcionário");
    }
  }
}