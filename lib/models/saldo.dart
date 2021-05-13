import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor) {
    this.valor += valor;
//Toda vez que a gente precisar que nosso componente seja atualizado precisamos colocar o notifyListeners
    notifyListeners();
  }

  void subtrai(double valor) {
    this.valor -= valor;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
