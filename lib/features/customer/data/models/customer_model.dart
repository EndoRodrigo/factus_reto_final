class CustomerModel {
  final int? id;
  final String identification;
  final String? dv;
  final String? company;
  final String? tradeName;
  final String names;
  final String address;
  final String email;
  final String phone;
  final String legalOrganizationId;
  final String tributeId;
  final int identificationDocumentId;
  final String municipalityId;
  final String? createdAt;
  final String? updatedAt;

  const CustomerModel({
    this.id,
    required this.identification,
    this.dv,
    this.company,
    this.tradeName,
    required this.names,
    required this.address,
    required this.email,
    required this.phone,
    this.legalOrganizationId = '2',
    this.tributeId = '21',
    this.identificationDocumentId = 3,
    required this.municipalityId,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int?,
      identification: json['identification'] as String? ?? '',
      dv: json['dv'] as String?,
      company: json['company'] as String?,
      tradeName: json['trade_name'] as String? ?? json['tradeName'] as String?,
      names: json['names'] as String? ?? '',
      address: json['address'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      legalOrganizationId:
          (json['legal_organization_id'] ?? json['legalOrganizationId'] ?? '2')
              .toString(),
      tributeId: (json['tribute_id'] ?? json['tributeId'] ?? '21').toString(),
      identificationDocumentId: json['identification_document_id'] != null
          ? int.tryParse(json['identification_document_id'].toString()) ?? 3
          : (json['identificationDocumentId'] as int? ?? 3),
      municipalityId: (json['municipality_id'] ?? json['municipalityId'] ?? '')
          .toString(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'identification': identification,
      'dv': dv ?? '',
      'company': company ?? '',
      'trade_name': tradeName ?? '',
      'names': names,
      'address': address,
      'email': email,
      'phone': phone,
      'legal_organization_id': legalOrganizationId,
      'tribute_id': tributeId,
      'identification_document_id': identificationDocumentId,
      'municipality_id': municipalityId,
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt,
    };
  }

  Map<String, dynamic> toJson() => toMap();
}
