import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'establishmest_provider.dart';
import 'establishmest_state.dart';

class EstablistmeNotifier extends Notifier<EstablishmestState> {
  @override
  EstablishmestState build() {
    return const EstablishmestState();
  }

  Future<bool> createEstablishment({required Establishment establishment}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(stablishmentsUseCaseProvider);
      await useCase.addItem(establishment: establishment);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final establishmentNotifierProvider =
    NotifierProvider<EstablistmeNotifier, EstablishmestState>(() {
  return EstablistmeNotifier();
});
