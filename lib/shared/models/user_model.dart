class LoginModel {
  String? nome;
  String? email;
  String? password;
  bool? keepon;

  LoginModel({this.nome, this.email, this.password, this.keepon});

  LoginModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    keepon = json['keepon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.password;
    data['keepon'] = this.keepon;
    return data;
  }

  String toString() {
    return "Nome: ${this.nome} \n Email:${this.email} \n Password:${this.password} ";
  }
}
