import 'package:flutter_test/flutter_test.dart';
import 'package:themes/boletos/controladores/boleto_controlador.dart';

void main() {
  test('calcula total con IVA y descuento', () {
    final c = BoletoControlador();

    final b = c.crearBoleto(
      nombrePasajero: 'Ana',
      ruta: 'Latacunga-Quito',
      tipoPasajero: 'estudiante',
      numeroBoletos: 2,
    );

    // Tarifa Quito: 5.00, subtotal = 10.00
    // Estudiante: 50% => descuento 5.00
    // Base: 5.00, IVA 15% => 0.75
    // Total: 5.75
    expect(b.subtotal, closeTo(10.0, 1e-9));
    expect(b.descuento, closeTo(5.0, 1e-9));
    expect(b.iva, closeTo(0.75, 1e-9));
    expect(b.total, closeTo(5.75, 1e-9));
  });
}
