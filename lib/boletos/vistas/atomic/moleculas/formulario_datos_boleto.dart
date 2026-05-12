import 'package:flutter/material.dart';

import '../atomos/boleto_campo_texto_pasajero.dart';
import '../atomos/boleto_campo_numero_boletos.dart';
import '../atomos/boleto_selector_simple.dart';

class FormularioDatosBoleto extends StatelessWidget {
  const FormularioDatosBoleto({
    super.key,
    required this.formKey,
    required this.nombreController,
    required this.boletosController,
    required this.rutaSeleccionada,
    required this.tipoSeleccionado,
    required this.onRutaChanged,
    required this.onTipoChanged,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nombreController;
  final TextEditingController boletosController;
  final String? rutaSeleccionada;
  final String? tipoSeleccionado;
  final ValueChanged<String?> onRutaChanged;
  final ValueChanged<String?> onTipoChanged;

  static const rutas = <String>[
    'Latacunga-Quito',
    'Latacunga-Ambato',
    'Latacunga-Guayaquil',
  ];

  static const tipos = <String>[
    'normal',
    'estudiante',
    'tercera edad',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BoletoCampoTextoPasajero(controller: nombreController),
          const SizedBox(height: 16),
          BoletoSelectorSimple(
            label: 'Ruta',

            value: rutaSeleccionada,
            items: rutas,
            onChanged: onRutaChanged,
          ),
          const SizedBox(height: 16),
          BoletoSelectorSimple(
            label: 'Tipo de pasajero',

            value: tipoSeleccionado,
            items: tipos,
            onChanged: onTipoChanged,
          ),
          const SizedBox(height: 16),
          BoletoCampoNumeroBoletos(controller: boletosController),
        ],
      ),
    );
  }
}
