import 'package:bytebank/components/botao.dart';
import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '00.0';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _titleButton = 'Enviar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: _dicaCampoNumeroConta,
                  rotulo: _rotuloCampoNumeroConta),
              Editor(
                controlador: _controladorCampoValor,
                dica: _dicaCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              Button(
                  controladorNumConta: _controladorCampoNumeroConta,
                  controladorValor: _controladorCampoValor,
                  title: _titleButton),
            ],
          ),
        ));
  }
}
