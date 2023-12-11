/// address : "cairo\n"
/// mail : "abdomohamed950@icloud.com\n"
/// name : "wegz\n"
/// phone : "01063677938\n"

class profile_info {
  profile_info({
    this.address,
    this.mail,
    this.name,
    this.phone,
  });

  profile_info.fromJson(dynamic json) {
    address = json['address'];
    mail = json['mail'];
    name = json['name'];
    phone = json['phone'];
  }
  String? address;
  String? mail;
  String? name;
  String? phone;
  profile_info copyWith({
    String? address,
    String? mail,
    String? name,
    String? phone,
  }) =>
      profile_info(
        address: address ?? this.address,
        mail: mail ?? this.mail,
        name: name ?? this.name,
        phone: phone ?? this.phone,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['mail'] = mail;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}
