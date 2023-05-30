import 'dart:convert';

class PostModel {
  int? id;
  int? userId;
  String? userName;
  int? categoryId;
  String? title;
  String? content;
  String? photoPath;
  DateTime? createdAt;
  PostModel({
    this.id,
    this.userId,
    this.userName,
    this.categoryId,
    this.title,
    this.content,
    this.photoPath,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'categoryId': categoryId,
      'title': title,
      'content': content,
      'photoPath': photoPath,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      categoryId: map['categoryId'],
      title: map['title'],
      content: map['content'],
      photoPath: map['photoPath'],
      createdAt: map["created_at"] != null ? DateTime.parse(map["created_at"]) : null,
    );
  }

  static List<PostModel> fromList(list) {
    return List<PostModel>.from(list.map((x) => PostModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(id: $id, userId: $userId, userName: $userName, categoryId: $categoryId, title: $title, content: $content, photoPath: $photoPath, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.id == id &&
        other.userId == userId &&
        other.userName == userName &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.content == content &&
        other.photoPath == photoPath &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ userName.hashCode ^ categoryId.hashCode ^ title.hashCode ^ content.hashCode ^ photoPath.hashCode ^ createdAt.hashCode;
  }
}
