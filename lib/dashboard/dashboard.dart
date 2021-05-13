import 'package:bytebank/dashboard/saldo.dart';
import 'package:bytebank/screen/transferencia/deposito/formulario.dart';
import 'package:bytebank/screen/transferencia/formulario.dart';
import 'package:bytebank/screen/transferencia/ultimas.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Receber deposito'),
              color: Colors.green,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormularioDeposito();
                }));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Nova Transferencia'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FormularioTransferencia();
                    },
                  ),
                );
              },
            )
          ],
        ),
        UltimasTransferencias()
      ]),
    );
  }
}
