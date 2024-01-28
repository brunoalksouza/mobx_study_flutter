import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutter/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  _textField(
      {String? labelText, onChanged, required String? Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Nome',
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            },
          ),
          const SizedBox(height: 30),
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Email',
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            },
          ),
          const SizedBox(height: 30),
          Observer(
            builder: (_) {
              return ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  controller.isValid ? () : print('Formulário inválido');
                },
              );
            },
          )
        ],
      ),
    );
  }
}
