import '../../domain/entities/establishment.dart';
import '../models/Establismet_model.dart';

class EstablishmentMapper {
  /// Convierte una Entidad del Dominio (Establishment) a un Modelo de Datos (EstablismetModel)
  static EstablismetModel toModel(Establishment entity) {
    return EstablismetModel(
      id: entity.id,
      name: entity.name,
      nit: entity.nit,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      municipalityCode: entity.municipalityCode,
      municipalityName: entity.municipalityName,
      createdAt: entity.createdAt,
    );
  }

  /// Convierte un Modelo de Datos (EstablismetModel) a una Entidad del Dominio (Establishment)
  static Establishment toEntity(EstablismetModel model) {
    return Establishment(
      id: model.id,
      name: model.name,
      nit: model.nit,
      email: model.email,
      phone: model.phone,
      address: model.address,
      municipalityCode: model.municipalityCode,
      municipalityName: model.municipalityName,
      createdAt: model.createdAt,
    );
  }
}
