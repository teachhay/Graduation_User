class Address {
  final String? house;
  final String? street;
  final String? state;
  final String? city;
  final String? country;
  final String? zipCode;

  const Address({
    required this.house,
    required this.state,
    required this.city,
    required this.street,
    required this.country,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      house: json["house"] as String,
      state: json["state"] as String,
      city: json["city"] as String,
      street: json["street"] as String,
      country: json["country"] as String,
      zipCode: json["zipCode"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "house": house,
      "state": state,
      "city": city,
      "street": street,
      "country": country,
      "zipCode": zipCode,
    };
  }
}
