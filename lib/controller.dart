import 'package:mobx/mobx.dart';
import 'package:mobx_flutter/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();
  
  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String? validateName() {
    if (client.name == null || client.name!.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? validateEmail() {
    if (client.email == null || client.email!.isEmpty) {
      return 'Campo obrigatório';
    } else if (!client.email!.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }
}
