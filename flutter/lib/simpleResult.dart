import 'package:flutter/material.dart';
import 'package:glossario_agro/Termo.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SimpleResult extends StatelessWidget {
  String termo;
  SimpleResult(this.termo);

  Future<Termo> _getTermos(termo) async {
    try {
      Termo term = new Termo();
      var response = await http.post("http://192.168.8.53:8000/termo/" + termo);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(utf8.decode(response.bodyBytes));
        term = Termo.fromJson(decodeJson);
        return term;
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
          future: _getTermos(termo),
          builder: (BuildContext context, AsyncSnapshot<Termo> snapshot) {
            if (!snapshot.hasData)
              return Column(
                children: <Widget>[
                  Text("Nenhum registro encontrado"),
                ],
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Padding(
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
                                Text(snapshot.data.termo),
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
                                Text(snapshot.data.area),
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
                                Text(snapshot.data.expressao),
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
                                  snapshot.data.definicao,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Image.network(
                          snapshot.data.urlImg,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
