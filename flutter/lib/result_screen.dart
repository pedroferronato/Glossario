import 'package:flutter/material.dart';
import 'package:glossario_agro/Termo.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import './wid_imagem.dart';
import './wid_dados_termo.dart';

class ResultScreen extends StatelessWidget {
  Future<List<Termo>> listaResultados;
  String busca = '';
  ResultScreen(this.busca);

  Future<List<Termo>> _getTermos(String termo) async {
    try {
      List<Termo> listTerm = List();
      var response =
          await http.post("http://192.168.8.53:8000/termos/" + termo);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(utf8.decode(response.bodyBytes));
        decodeJson.forEach((item) => listTerm.add(Termo.fromJson(item)));
        return listTerm;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: FutureBuilder(
          future: _getTermos(busca),
          builder: (BuildContext context, AsyncSnapshot<List<Termo>> snapshot) {
            try {
              if (snapshot.data[0].termo == null) {}
            } catch (e) {
              return Column(
                children: <Widget>[
                  Text("Nenhum registro encontrado"),
                ],
              );
            }
            List<Termo> content = snapshot.data;
            return ListView.builder(
              itemCount: content.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      DadosTermo(content[index]),
                      PadraoImagem(content[index].urlImg),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
