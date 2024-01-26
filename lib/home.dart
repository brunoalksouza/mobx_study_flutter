import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatelessWidget {
  _textField({String? labelText, onChanged, String Function()? errorText}) {
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
            _textField(labelText: 'name'),
          ],
        ),
      ),
    );
  }
}
