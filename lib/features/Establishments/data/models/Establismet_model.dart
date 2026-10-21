class EstablismetModel {
  final int? id;
  final String name;
  final String nit;
  final String email;
  final String phone;
  final String address;
  final String municipalityCode;
  final String municipalityName;
  final String? createdAt;

  const EstablismetModel({
    this.id,
    required this.name,
    required this.nit,
    required this.email,
    required this.phone,
    required this.address,
    required this.municipalityCode,
    required this.municipalityName,
    this.createdAt,
  });

  factory EstablismetModel.fromMap(Map<String, dynamic> json) {
    return EstablismetModel(
      name: json['name'],
      nit: json['nit'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      municipalityCode: json['municipalityCode'],
      municipalityName: json['municipalityName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nit': nit,
      'email': email,
      'phone': phone,
      'address': address,
      'municipalityCode': municipalityCode,
      'municipalityName': municipalityName,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
