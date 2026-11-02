import 'package:flutter/material.dart';

import '../Establishments/presentation/providers/establishmest_state.dart';

class BuildFilledButton extends StatelessWidget {
  final EstablishmestState state;
  final VoidCallback? onPressed;

  const BuildFilledButton({
    super.key,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton.icon(
        onPressed: state.isLoading ? null : onPressed,
        icon: state.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.save),
        label: Text(
          state.isLoading ? 'Guardando...' : 'Guardar establecimiento',
        ),
      ),
    );
  }
}
