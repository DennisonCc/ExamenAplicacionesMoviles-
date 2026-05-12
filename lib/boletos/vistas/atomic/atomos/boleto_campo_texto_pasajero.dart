import 'package:flutter/material.dart';

class BoletoCampoTextoPasajero extends StatelessWidget {
  const BoletoCampoTextoPasajero({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Nombre del pasajero'
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Ingrese el nombre';
        }
        return null;
      },
    );
  }
}
