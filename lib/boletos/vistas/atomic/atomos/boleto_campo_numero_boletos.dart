import 'package:flutter/material.dart';

class BoletoCampoNumeroBoletos extends StatelessWidget {
  const BoletoCampoNumeroBoletos({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'Numero de boletos',

      ),
      validator: (value) {
        final raw = (value ?? '').trim();
        if (raw.isEmpty) return 'Ingrese el numero de boletos';
        final n = int.tryParse(raw);
        if (n == null) return 'Ingrese un numero valido';
        if (n <= 0) return 'Debe ser mayor a cero';
        return null;
      },
    );
  }
}
