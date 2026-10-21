import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';

abstract class EstablismetRepository {
  Future<int> addItem({ required Establishment establishment });
}