import 'package:flutter/material.dart';

class BoletoSelectorSimple extends StatelessWidget {
  const BoletoSelectorSimple({
    super.key,
    required this.label,

    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;

  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,

      ),
      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: onChanged,
      validator: (v) {
        if (v == null || v.trim().isEmpty) {
          return 'Seleccione una opcion';
        }
        return null;
      },
    );
  }
}
