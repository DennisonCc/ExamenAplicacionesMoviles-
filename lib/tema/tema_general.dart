import 'package:flutter/material.dart';

import 'colores_app.dart';
import 'tipografia_app.dart';

import 'componentes/tema_appbar.dart';
import 'componentes/tema_botones.dart';
import 'componentes/tema_inputs.dart';
import 'componentes/tema_cards.dart';
import 'componentes/tema_checkbox.dart';
import 'componentes/tema_floating.dart';

class TemaGeneral {

  // =====================================
  // TEMA CLARO
  // =====================================

  static ThemeData temaClaro =
      ThemeData(

    useMaterial3: true,

    brightness: Brightness.light,

    scaffoldBackgroundColor:
        ColoresApp.fondo,

    colorScheme: const ColorScheme.light(

      primary:
          ColoresApp.primario,

      secondary:
          ColoresApp.secundario,

      surface:
          ColoresApp.superficie,

      onSurface:
          ColoresApp.textoOscuro,

      onPrimary:
          Colors.white,

      onSecondary:
          ColoresApp.textoOscuro,

      error:
          ColoresApp.error,
    ),

    textTheme:
        TipografiaApp.claro,

    appBarTheme:
        TemaAppBar.claro,

    elevatedButtonTheme:
        TemaBotones.claro,

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColoresApp.primario,
        side: const BorderSide(color: ColoresApp.primario),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme:
        TemaInputs.claro,

    cardTheme:
        TemaCards.claro,

    // Reutiliza componentes ya definidos.
    checkboxTheme: TemaCheckbox.claro,
    floatingActionButtonTheme: TemaFloating.claro,
  );

  // =====================================
  // TEMA OSCURO
  // =====================================

  static ThemeData temaOscuro =
      ThemeData(

    useMaterial3: true,

    brightness: Brightness.dark,

    scaffoldBackgroundColor:
        ColoresApp.fondoOscuro,

    colorScheme:
        const ColorScheme.dark(
          primary: ColoresApp.primario,
          secondary: ColoresApp.secundario,
          surface: ColoresApp.superficieOscura, // Para que las Cards sepan su color
          onSurface: ColoresApp.textoBlanco,    // Indica que el texto sobre superficies es blanco
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.redAccent,
    ),

    textTheme:
        TipografiaApp.oscuro,
    appBarTheme:
        TemaAppBar.oscuro,

    elevatedButtonTheme:
        TemaBotones.oscuro,

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColoresApp.textoBlanco,
        side: const BorderSide(color: ColoresApp.primario),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme:
        TemaInputs.oscuro,

    cardTheme:
        TemaCards.oscuro,

    checkboxTheme: TemaCheckbox.oscuro,
    floatingActionButtonTheme: TemaFloating.oscuro,
  );
}
