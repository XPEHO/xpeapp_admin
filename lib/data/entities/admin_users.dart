class AdminUsers {
  final List<String> users;

  AdminUsers({
    required this.users,
  });

  factory AdminUsers.fromJson(Map<String, dynamic> json) {
    return AdminUsers(
      users: json['users'].map<String>((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
    };
  }
}
