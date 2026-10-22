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
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      nit: json['nit'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      municipalityCode: json['municipalityCode'] as String? ?? '',
      municipalityName: json['municipalityName'] as String? ?? '',
      createdAt: json['createdAt'] as String?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'nit': nit,
      'email': email,
      'phone': phone,
      'address': address,
      'municipalityCode': municipalityCode,
      'municipalityName': municipalityName,
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
    };
  }
}
