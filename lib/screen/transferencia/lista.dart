import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screen/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Transferências';

//StateFulWidget ele tem um estado interno do nosso componente, ele é preciso pra gerenciar coisas internas do nosso componente
//Quero que o componente escute todas as modificações que tiver no nosso estado global
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(builder: (context, transferencias, child) {
        return ListView.builder(
          itemCount: transferencias.transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = transferencias.transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        //child seria o conteudo que a gente consegue colocar no button
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  //para indicar valores constantes
  final Transferencia _transferencia;

  //Criar um construtor
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.toStringValor()),
      subtitle: Text(_transferencia.toStringConta()),
    ));
  }
}
