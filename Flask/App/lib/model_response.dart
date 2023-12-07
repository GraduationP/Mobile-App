/// color : "blue\n"
/// model : "kia_sportage\n"

class ModelResponse {
  ModelResponse({
      this.color, 
      this.model,});

  ModelResponse.fromJson(dynamic json) {
    color = json['color'];
    model = json['model'];
  }
  String? color;
  String? model;
ModelResponse copyWith({  String? color,
  String? model,
}) => ModelResponse(  color: color ?? this.color,
  model: model ?? this.model,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['model'] = model;
    return map;
  }

}