import 'package:flutter/material.dart';

class PadraoImagem extends StatelessWidget {
  final String url;
  PadraoImagem(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      child: Image.network(
        url,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      /*
      
      Este modelo deve ser usado para carregar imagens vindas do asset do programa

      Image.asset(
        url,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),*/
    );
  }
}
