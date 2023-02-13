class LoginModel {
  String? name;
  String? email;
  String? password;
  bool? connect;

  LoginModel({this.name, this.email, this.password, this.connect});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    connect = json['connect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['connect'] = this.connect;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Name: $name | Email : $email | Password: $password | Connect : $connect";
  }
}