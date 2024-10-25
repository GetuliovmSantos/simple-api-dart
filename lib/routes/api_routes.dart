import 'package:shelf_router/shelf_router.dart';

import '../controllers/funcionario_controller.dart';

class ApiRoutes {
  final _funcionarioController = FuncionarioController();

  Router get router {
    final router = Router();

    router.get('/funcionarios', _funcionarioController.getFuncionarios);
    router.post('/funcionarios', _funcionarioController.addFuncionario);
    router.delete('/funcionarios/<id>', _funcionarioController.deleteFuncionario);

    return router;
  }
}