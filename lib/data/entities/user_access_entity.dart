class UserAccessEntity {
  final String idAccess;
  final String name;
  final String description;

  UserAccessEntity({
    required this.idAccess,
    required this.name,
    required this.description,
  });

  factory UserAccessEntity.fromJson(Map<String, dynamic> json) {
    return UserAccessEntity(
      idAccess: json['idAccess'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idAccess': idAccess,
      'name': name,
      'description': description,
    };
  }
}
