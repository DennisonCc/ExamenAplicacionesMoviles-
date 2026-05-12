import 'package:flutter/material.dart';

import '../controladores/boleto_controlador.dart';
import 'atomic/atomos/boleto_boton_principal.dart';
import 'atomic/moleculas/formulario_datos_boleto.dart';
import 'vista_nota_venta_boleto.dart';

class VistaCompraBoleto extends StatefulWidget {
  const VistaCompraBoleto({super.key});

  static const routeName = '/boletos';

  @override
  State<VistaCompraBoleto> createState() => _VistaCompraBoletoState();
}

class _VistaCompraBoletoState extends State<VistaCompraBoleto> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _boletosController = TextEditingController();

  final _controlador = BoletoControlador();

  String? _ruta;
  String? _tipo;

  @override
  void dispose() {
    _nombreController.dispose();
    _boletosController.dispose();
    super.dispose();
  }

  void _comprar() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    try {
      final boleto = _controlador.crearBoleto(
        nombrePasajero: _nombreController.text,
        ruta: _ruta ?? '',
        tipoPasajero: _tipo ?? '',
        numeroBoletos: int.parse(_boletosController.text.trim()),
      );

      Navigator.of(context).pushNamed(
        VistaNotaVentaBoleto.routeName,
        arguments: boleto,
      );
    } on FormatException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Compra de boletos'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingrese los datos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              FormularioDatosBoleto(
                formKey: _formKey,
                nombreController: _nombreController,
                boletosController: _boletosController,
                rutaSeleccionada: _ruta,
                tipoSeleccionado: _tipo,
                onRutaChanged: (v) => setState(() => _ruta = v),
                onTipoChanged: (v) => setState(() => _tipo = v),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _PreviewTarifa(
                    ruta: _ruta,
                    tipo: _tipo,
                    controlador: _controlador,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BoletoBotonPrincipal(
                texto: 'Generar nota de venta',
                onPressed: _comprar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewTarifa extends StatelessWidget {
  const _PreviewTarifa({
    required this.ruta,
    required this.tipo,
    required this.controlador,
  });

  final String? ruta;
  final String? tipo;
  final BoletoControlador controlador;

  @override
  Widget build(BuildContext context) {
    final tarifa = ruta == null ? null : controlador.tarifaBasePorRuta(ruta!);
    final descuentoRate = tipo == null ? null : controlador.descuentoRatePorTipo(tipo!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vista previa', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text('Tarifa base: ${tarifa == null ? '-' : '\$${tarifa.toStringAsFixed(2)}'}'),
        Text('Descuento: ${descuentoRate == null ? '-' : '${(descuentoRate * 100).toStringAsFixed(0)}%'}'),
        const SizedBox(height: 4),
        const Text('IVA: 15%'),
      ],
    );
  }
}
