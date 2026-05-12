class BoletoModelo {
  BoletoModelo({
    required this.nombrePasajero,
    required this.ruta,
    required this.tipoPasajero,
    required this.numeroBoletos,
    required this.subtotal,
    required this.descuento,
    required this.iva,
    required this.total,
  });

  final String nombrePasajero;
  final String ruta;
  final String tipoPasajero;
  final int numeroBoletos;

  final double subtotal;
  final double descuento;
  final double iva;
  final double total;
}
