import 'package:flutter/material.dart';

class PerfilProfesional {
  final String nombre;
  final String especialidad; // La descripción
  final String imagenUrl;
  final double calificacion;

  PerfilProfesional({
    required this.nombre,
    required this.especialidad,
    required this.imagenUrl,
    required this.calificacion,
  });
}
