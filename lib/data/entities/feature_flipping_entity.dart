class FeatureFlippingEntity {
  final String idFeature;
  final String name;
  final String description;
  final bool enabled;

  FeatureFlippingEntity({
    required this.idFeature,
    required this.name,
    required this.description,
    required this.enabled,
  });

  factory FeatureFlippingEntity.fromJson(Map<String, dynamic> json) {
    return FeatureFlippingEntity(
      idFeature: json['idFeature'],
      name: json['name'],
      description: json['description'],
      enabled: json['enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idFeature': idFeature,
      'name': name,
      'description': description,
      'enabled': enabled,
    };
  }
}
