import 'package:flutter/material.dart';

import '../../../modelos/boleto_modelo.dart';

class BloqueResumenNotaVenta extends StatelessWidget {
  const BloqueResumenNotaVenta({
    super.key,
    required this.boleto,
    required this.moneda,
  });

  final BoletoModelo boleto;
  final String Function(double) moneda;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nota de venta', style: t.titleLarge),
            const SizedBox(height: 12),
            _fila('Pasajero', boleto.nombrePasajero),
            _fila('Ruta', boleto.ruta),
            _fila('Tipo', boleto.tipoPasajero),
            _fila('Boletos', boleto.numeroBoletos.toString()),
            const Divider(height: 24),
            _fila('Subtotal', moneda(boleto.subtotal)),
            _fila('Descuento', '- ${moneda(boleto.descuento)}'),
            _fila('IVA (15%)', moneda(boleto.iva)),
            const SizedBox(height: 6),
            _fila(
              'Total',
              moneda(boleto.total),
              valueStyle: t.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fila(
    String label,
    String value, {
    TextStyle? valueStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 12),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
