import 'package:flutter/material.dart';

import 'tema/export.dart';
import 'boletos/modelos/boleto_modelo.dart';
import 'boletos/vistas/vista_compra_boleto.dart';
import 'boletos/vistas/vista_nota_venta_boleto.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compra de boletos',
      theme: TemaGeneral.temaClaro,
      darkTheme: TemaGeneral.temaOscuro,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const VistaCompraBoleto(),
        VistaCompraBoleto.routeName: (context) => const VistaCompraBoleto(),
        VistaNotaVentaBoleto.routeName: (context) => const _RutaNotaVentaBoleto(),
      },
      onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => const _RutaInvalida()),
    );
  }
}

class _RutaNotaVentaBoleto extends StatelessWidget {
  const _RutaNotaVentaBoleto();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! BoletoModelo) {
      return const _RutaInvalida();
    }
    return VistaNotaVentaBoleto(boleto: args);
  }
}

class _RutaInvalida extends StatelessWidget {
  const _RutaInvalida();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ruta invalida')),
      body: const Center(
        child: Text('No se pudo abrir la pantalla solicitada.'),
      ),
    );
  }
}
