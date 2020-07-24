import 'package:flutter/material.dart';
import 'package:glossario_agro/Termo.dart';

class DadosTermo extends StatelessWidget {
  final Termo resultado;
  DadosTermo(this.resultado);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Termo: ',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                width: 5,
              ),
              Text(resultado.termo),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Área: ',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                width: 5,
              ),
              Text(resultado.area),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Expressão: ',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                width: 5,
              ),
              Text(resultado.expressao),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Definição: ',
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                resultado.definicao,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
