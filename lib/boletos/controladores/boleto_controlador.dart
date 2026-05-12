import '../modelos/boleto_modelo.dart';

class BoletoControlador {
  static const double _ivaRate = 0.15;

  // Valores por defecto (editables) ya que el enunciado no define tarifas.
  static const Map<String, double> _tarifaPorRuta = {
    'Latacunga-Quito': 5.00,
    'Latacunga-Ambato': 3.00,
    'Latacunga-Guayaquil': 12.00,
  };

  static const Map<String, double> _descuentoRatePorTipo = {
    'normal': 0.0,
    'estudiante': 0.50,
    'tercera edad': 0.30,
  };

  /// Construye el [BoletoModelo] validando y calculando todos los valores.
  /// Lanza [FormatException] si hay errores de validacion.
  BoletoModelo crearBoleto({
    required String nombrePasajero,
    required String ruta,
    required String tipoPasajero,
    required int numeroBoletos,
  }) {
    final nombre = nombrePasajero.trim();
    if (nombre.isEmpty) {
      throw const FormatException('Ingrese el nombre del pasajero.');
    }

    if (!_tarifaPorRuta.containsKey(ruta)) {
      throw const FormatException('Seleccione una ruta valida.');
    }

    if (!_descuentoRatePorTipo.containsKey(tipoPasajero)) {
      throw const FormatException('Seleccione un tipo de pasajero valido.');
    }

    if (numeroBoletos <= 0) {
      throw const FormatException('El numero de boletos debe ser mayor a cero.');
    }

    final tarifaBase = _tarifaPorRuta[ruta]!;
    final subtotal = tarifaBase * numeroBoletos;
    final descuentoRate = _descuentoRatePorTipo[tipoPasajero]!;
    final descuento = subtotal * descuentoRate;
    final baseConDescuento = subtotal - descuento;
    final iva = baseConDescuento * _ivaRate;
    final total = baseConDescuento + iva;

    return BoletoModelo(
      nombrePasajero: nombre,
      ruta: ruta,
      tipoPasajero: tipoPasajero,
      numeroBoletos: numeroBoletos,
      subtotal: subtotal,
      descuento: descuento,
      iva: iva,
      total: total,
    );
  }

  double tarifaBasePorRuta(String ruta) => _tarifaPorRuta[ruta] ?? 0;
  double descuentoRatePorTipo(String tipo) => _descuentoRatePorTipo[tipo] ?? 0;
}
