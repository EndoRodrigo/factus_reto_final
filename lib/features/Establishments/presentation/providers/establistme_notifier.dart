import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'establishmest_provider.dart';
import 'establishmest_state.dart';

class EstablistmeNotifier extends Notifier<EstablishmestState> {

   late final _estabilmentsCreateUseCase;

  @override
  EstablishmestState build() {
    _estabilmentsCreateUseCase = ref.watch(stablishmentsUseCaseProvider);
    return EstablishmestState();
  }

  Future<void> createEstablishment({ required Establishment establishment }) async {
    state = state.copyWith(isLoading: true);

    try{
      await _estabilmentsCreateUseCase.createEstablishment(establishment: establishment);
      state = state.copyWith(isLoading: false);
    }catch(e){
      state = state.copyWith(isLoading: false, error: e.toString());
    }

  }
}

final establishmentNotifierProvider = NotifierProvider<EstablistmeNotifier, EstablishmestState>(() {
  return EstablistmeNotifier();
});

