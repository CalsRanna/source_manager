class DebugResult {
  DebugResult({
    this.title = '',
    this.html = '',
    this.json = '',
  });

  String title;
  String html;
  String json;

  factory DebugResult.fromJson(Map<String, dynamic> json) {
    return DebugResult(
      title: json['title'],
      html: json['html'],
      json: json['json'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'html': html,
      'json': json,
    };
  }
}
