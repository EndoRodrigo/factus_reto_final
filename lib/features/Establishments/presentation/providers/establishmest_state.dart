import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';

class EstablishmestState {
  final bool isLoading;
  final List<Establishment> establishments;
  final String? error;

  new({this.isLoading = false, this.establishments = const [], this.error});

  EstablishmestState copyWith({
    bool? isLoading,
    List<Establishment>? establishments,
    String? error,
  }) {
    return EstablishmestState(
      isLoading: isLoading ?? this.isLoading,
      establishments: establishments ?? this.establishments,
      error: error ?? this.error,
    );
  }
}