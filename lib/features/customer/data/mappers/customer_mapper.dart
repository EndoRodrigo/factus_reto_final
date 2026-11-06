import '../../domain/entities/customer.dart';
import '../models/customer_model.dart';

class CustomerMapper {
  /// Convierte una Entidad del Dominio (Customer) a un Modelo de Datos (CustomerModel)
  static CustomerModel toModel(Customer entity) {
    return CustomerModel(
      id: entity.id,
      identification: entity.identification,
      dv: entity.dv,
      company: entity.company,
      tradeName: entity.tradeName,
      names: entity.names,
      address: entity.address,
      email: entity.email,
      phone: entity.phone,
      legalOrganizationId: entity.legalOrganizationId,
      tributeId: entity.tributeId,
      identificationDocumentId: entity.identificationDocumentId,
      municipalityId: entity.municipalityId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Convierte un Modelo de Datos (CustomerModel) a una Entidad del Dominio (Customer)
  static Customer toEntity(CustomerModel model) {
    return Customer(
      id: model.id,
      identification: model.identification,
      dv: model.dv,
      company: model.company,
      tradeName: model.tradeName,
      names: model.names,
      address: model.address,
      email: model.email,
      phone: model.phone,
      legalOrganizationId: model.legalOrganizationId,
      tributeId: model.tributeId,
      identificationDocumentId: model.identificationDocumentId,
      municipalityId: model.municipalityId,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
