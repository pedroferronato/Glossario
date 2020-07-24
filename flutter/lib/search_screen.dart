import 'package:flutter/material.dart';
import 'package:glossario_agro/Termo.dart';
import 'package:glossario_agro/simpleResult.dart';
import './result_screen.dart';

class SearchScreen extends StatefulWidget {
  static List<String> valores = ['Exatamente igual', 'Semelhante'];
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selecionado = SearchScreen.valores[0];
  final _textoBusca = TextEditingController();

  List<Termo> _termos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Glossário')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            elevation: 7,
            child: TextField(
              controller: _textoBusca,
              textAlign: TextAlign.left,
              onChanged: null,
              decoration: InputDecoration(
                  labelText: "Insira sua busca",
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            width: 300,
            child: DropdownButton(
              value: _selecionado,
              style: TextStyle(color: Colors.green),
              items: SearchScreen.valores
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  _selecionado = newValue;
                });
              },
            ),
          ),
          Container(
            width: 300,
            child: RaisedButton(
              child: Text(
                'Buscar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _textoBusca.text != ""
                    ? _selecionado == 'Semelhante'
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ResultScreen(_textoBusca.text),
                            ),
                          )
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SimpleResult(_textoBusca.text)))
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Adicione um valor para busca"),
                          );
                        },
                      );
              },
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
