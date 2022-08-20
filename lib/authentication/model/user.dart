class Users {
  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  String? id;
  String? name;
  String? email;

  String? phone;
  Address? address;

  factory Users.fromJson(Map json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address?.toJson(),
      };
}

class Address {
  Address({
    this.latitude,
    this.longitude,
    this.addressName,
  });

  double? latitude;
  double? longitude;
  String? addressName;

  factory Address.fromJson(Map json) => Address(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        addressName: json["addressName"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "addressName": addressName,
      };
}
