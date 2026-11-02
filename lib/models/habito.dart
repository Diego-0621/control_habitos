
import 'package:flutter/material.dart';

class Habito {
  final String nombre;
  final IconData icono;
  final int meta;
  int contador;

  Habito({
    required this.nombre,
    required this.icono,
    required this.meta,
    this.contador = 0,
  });
}