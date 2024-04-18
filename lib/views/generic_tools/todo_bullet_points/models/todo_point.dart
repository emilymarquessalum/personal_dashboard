


class TODOPoint {
  final String title;

  bool completed;
  TODOPoint({required this.title,
  this.completed=false,
  });

  static TODOPoint fromJson(e) {
    return TODOPoint(title: e['title'],
    completed: e['completed']??false
    );
  }

  toMap() {
    return {
      'title': title,
      'completed': completed
    };
  }
}