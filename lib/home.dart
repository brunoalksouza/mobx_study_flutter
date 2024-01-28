import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutter/controller.dart';
import 'package:flutter_mobx/src/observer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
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
      ),
    );
  }
}
