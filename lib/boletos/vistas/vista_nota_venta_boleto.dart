import 'package:flutter/material.dart';

import '../modelos/boleto_modelo.dart';
import 'atomic/atomos/boleto_boton_principal.dart';
import 'atomic/moleculas/bloque_resumen_nota_venta.dart';
import 'vista_compra_boleto.dart';

class VistaNotaVentaBoleto extends StatelessWidget {
  const VistaNotaVentaBoleto({
    super.key,
    required this.boleto,
  });

  static const routeName = '/notaVentaBoleto';

  final BoletoModelo boleto;

  String _moneda(double v) => '\$${v.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nota de venta')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BloqueResumenNotaVenta(boleto: boleto, moneda: _moneda),
              const Spacer(),
              BoletoBotonPrincipal(
                texto: 'Nueva compra',
                onPressed: () {
                  Navigator.of(context).popUntil(
                    (route) => route.settings.name == VistaCompraBoleto.routeName || route.isFirst,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
