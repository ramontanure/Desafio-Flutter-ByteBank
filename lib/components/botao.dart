import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final TextEditingController controladorNumConta;
  final TextEditingController controladorValor;

  final String title;

  const Button({this.controladorNumConta, this.controladorValor, this.title});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(title), onPressed: () => _criarTransferencia(context));
  }

  void _criarTransferencia(BuildContext context) {
    //Fazer a conversão de tipos tem a classe int
    final int numeroConta = int.tryParse(controladorNumConta.text);
    final double valor = double.tryParse(controladorValor.text);
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);
    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);

      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;

    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }
}
