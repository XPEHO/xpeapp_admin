class Config {
  final String baseUrl;
  final String? firebaseWebPushVapidKey;

  Config({
    required this.baseUrl,
    this.firebaseWebPushVapidKey,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      baseUrl: json['baseUrl'],
      firebaseWebPushVapidKey: json['firebaseWebPushVapidKey'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'firebaseWebPushVapidKey': firebaseWebPushVapidKey,
    };
  }
}
