class ModelSatu {
  String? name;
  int? userId;
  String? email;

  ModelSatu({this.name, this.userId, this.email});

  ModelSatu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['email'] = this.email;
    return data;
  }
}