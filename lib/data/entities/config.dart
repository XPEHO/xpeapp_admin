class Config {
  final String baseUrl;

  Config({
    required this.baseUrl,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      baseUrl: json['baseUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
    };
  }
}
