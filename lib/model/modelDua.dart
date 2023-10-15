class ModelDua {
  int? id;
  String? firstname;
  String? midlename;
  String? lastname;
  String? createdAt;
  String? updatedAt;
  List<Posts>? posts;

  ModelDua(
      {this.id,
        this.firstname,
        this.midlename,
        this.lastname,
        this.createdAt,
        this.updatedAt,
        this.posts});

  ModelDua.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    midlename = json['midlename'];
    lastname = json['lastname'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['midlename'] = this.midlename;
    data['lastname'] = this.lastname;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? creatorId;

  Posts(
      {this.id,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.creatorId});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    creatorId = json['creatorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['creatorId'] = this.creatorId;
    return data;
  }
}