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
      initialRoute: VistaCompraBoleto.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
          case VistaCompraBoleto.routeName:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const VistaCompraBoleto(),
            );
          case VistaNotaVentaBoleto.routeName:
            final args = settings.arguments;
            if (args is! BoletoModelo) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const _RutaInvalida(),
              );
            }
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => VistaNotaVentaBoleto(boleto: args),
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const _RutaInvalida(),
            );
        }
      },
    );
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
