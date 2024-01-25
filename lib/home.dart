import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutter/controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: controller.changeName,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Sobrenome'),
                onChanged: controller.changeSobrenome,
              ),
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) {
                  return Text(
                    controller.nomeCompleto,
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
