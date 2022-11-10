class PostModel {
  int? id;
  String? title;
  String? content;
  String? image;
  String? author;
  String? createdAt;

  PostModel(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.author,
        this.createdAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    author = json['author'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['author'] = author;
    data['created_at'] = createdAt;
    return data;
  }
}