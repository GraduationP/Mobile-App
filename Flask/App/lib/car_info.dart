/// brand : "kia\n"
/// color : "red\n"
/// model : "2023\n"
/// version : "sportage\n"

class car_info {
  car_info({
    this.brand,
    this.color,
    this.model,
    this.version,
  });

  car_info.fromJson(dynamic json) {
    brand = json['brand'];
    color = json['color'];
    model = json['model'];
    version = json['version'];
  }
  String? brand;
  String? color;
  String? model;
  String? version;
  car_info copyWith({
    String? brand,
    String? color,
    String? model,
    String? version,
  }) =>
      car_info(
        brand: brand ?? this.brand,
        color: color ?? this.color,
        model: model ?? this.model,
        version: version ?? this.version,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand'] = brand;
    map['color'] = color;
    map['model'] = model;
    map['version'] = version;
    return map;
  }
}
