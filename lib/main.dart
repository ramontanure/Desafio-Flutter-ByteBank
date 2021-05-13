import 'package:bytebank/dashboard/dashboard.dart';
import 'package:bytebank/screen/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/saldo.dart';
import 'models/transferencias.dart';

//No runApp a gente nao consegue colocar dois widgets
//Dentro do runApp vai o elemento principal do aplicativo
//Somente dentro do runApp widget que recebe outros widgets
void main() {
  //runApp ponto de partida do flutter
  //Representa nosso aplicativo
  //Change Notifier Provider, provedor de notificação de mudança, quando alguma coisa muda, ele vai notificar
  //A gente tem que passar 2 coisas, a primeira é , o que ele vai ficar escutando observando, quem vai ter acesso a essas informações
  //Create ele vai ser responsavel pra da essa contextualizacao pra gente e que dados ele ta gerenciando
  //A gente vai falar quem vai conseguir ler esses dados aqui
  //Aqui dentro só aceita 1 context para que aceite mais use o multiProvider
  //Dentro de providers poosso passar n provider na lista
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      )
    ],
    child: BytebankApp(),
  ));
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
