


class SystemLink {
  final String title;
  final String url;

  SystemLink({required this.title, required this.url, });

  factory SystemLink.fromJson(Map<String, dynamic> json) {
    return SystemLink(
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
  };
}