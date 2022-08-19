class UserModel {
  String? cpf;
  String? password;

  UserModel({this.cpf, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    cpf = json['cpf'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpf'] = this.cpf;
    data['password'] = this.password;
    return data;
  }
}