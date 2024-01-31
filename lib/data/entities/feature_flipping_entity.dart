class FeatureFlippingEntity {
  final String idFeature;
  final String name;
  final String description;
  final bool uatEnabled;
  final bool prodEnabled;

  FeatureFlippingEntity({
    required this.idFeature,
    required this.name,
    required this.description,
    required this.uatEnabled,
    required this.prodEnabled,
  });

  factory FeatureFlippingEntity.fromJson(Map<String, dynamic> json) {
    return FeatureFlippingEntity(
      idFeature: json['idFeature'],
      name: json['name'],
      description: json['description'],
      uatEnabled: json['uatEnabled'],
      prodEnabled: json['prodEnabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idFeature': idFeature,
      'name': name,
      'description': description,
      'uatEnabled': uatEnabled,
      'prodEnabled': prodEnabled,
    };
  }
}
