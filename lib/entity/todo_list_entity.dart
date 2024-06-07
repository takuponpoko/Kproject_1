class Todo {
  String id;
  String title;
  bool isSelected;

  Todo({
    required this.id,
    required this.title,
    required this.isSelected,
  });

  // JSONからTodoオブジェクトを生成する
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isSelected: json['isSelected'],
    );
  }

  // TodoオブジェクトをJSONに変換する
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isSelected': isSelected,
    };
  }
}
