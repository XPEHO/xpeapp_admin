class Token {
  final String token;
  final String email;
  final String nicename;
  final String displayName;

  Token({
    required this.token,
    required this.email,
    required this.nicename,
    required this.displayName,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
      email: json['user_email'],
      nicename: json['user_nicename'],
      displayName: json['user_display_name'],
    );
  }
}
