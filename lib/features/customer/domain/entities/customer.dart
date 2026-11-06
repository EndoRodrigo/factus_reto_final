class Customer {
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

  const Customer({
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
}
