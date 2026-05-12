import 'package:flutter/material.dart';

class BoletoEtiqueta extends StatelessWidget {
  const BoletoEtiqueta(
    this.texto, {
    super.key,
    this.style,
    this.textAlign,
  });

  final String texto;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: style,
      textAlign: textAlign,
    );
  }
}
