class Termo {
  int id;
  String termo;
  String area;
  String expressao;
  String definicao;
  String urlImg;

  Termo(
      {this.id,
      this.termo,
      this.area,
      this.expressao,
      this.definicao,
      this.urlImg});

  Termo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termo = json['termo'];
    area = json['area'];
    expressao = json['expressao'];
    definicao = json['definicao'];
    urlImg = json['urlImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['termo'] = this.termo;
    data['area'] = this.area;
    data['expressao'] = this.expressao;
    data['definicao'] = this.definicao;
    data['urlImg'] = this.urlImg;
    return data;
  }
}