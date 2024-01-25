import 'package:mobx/mobx.dart';

class Controller {
  final _counter = Observable(0);
  int get counter => _counter.value;
  set counter(int newValue) => _counter.value = newValue;

  late Action increment;

  Controller() {
    increment = Action(_increment);
  }

  _increment() {
    counter++;
  }
}
