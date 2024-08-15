class AddressEntity {
  final String? address;
  final String? address2;
  final String? city;
  final String? cityName;
  final String? country;
  final String? region;
  final String? regionName;
  final String? zipCode;
  final double? lat;
  final double? lng;
  final String? county;
  final String? district;
  final String? wards;
  final String? countyCode;

  AddressEntity({
    this.address,
    this.address2,
    this.city,
    this.cityName,
    this.country,
    this.region,
    this.regionName,
    this.zipCode,
    this.lat,
    this.lng,
    this.county,
    this.district,
    this.wards,
    this.countyCode,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      address: json['address'],
      address2: json['address2'],
      city: json['city'],
      cityName: json['cityName'],
      country: json['country'],
      region: json['region'],
      regionName: json['regionName'],
      zipCode: json['zipCode'],
      lat: json['lat'],
      lng: json['lng'],
      county: json['county'],
      district: json['district'],
      wards: json['wards'],
      countyCode: json['countyCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'address2': address2,
      'city': city,
      'cityName': cityName,
      'country': country,
      'region': region,
      'regionName': regionName,
      'zipCode': zipCode,
      'lat': lat,
      'lng': lng,
      'county': county,
      'district': district,
      'wards': wards,
      'countyCode': countyCode,
    };
  }
}
