import 'package:flutter/material.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CustomTextArea extends StatelessWidget {
  // Opcional: Controlador para poder leer lo que el usuario escribe
  final TextEditingController? controller;

  const CustomTextArea({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      opacity: 0.85,
      color: Theme.of(context).colorScheme.inverseSurface,
      child: Container(
        // Altura fija del cuadro. Puedes cambiarla o envolver todo
        // en un Expanded si quieres que llene la pantalla.
        height: 350,
        decoration: BoxDecoration(
          color: Colors.transparent, // El color gris claro de tu imagen
          borderRadius: BorderRadius.circular(
            12,
          ), // Bordes suavemente redondeados
        ),
        // Padding interior para que el texto no se pegue a los bordes
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: controller,
          // --- LA MAGIA MULTILÍNEA ---
          maxLines:
              null, // 'null' permite que el texto crezca infinitamente hacia abajo
          keyboardType:
              TextInputType.multiline, // Muestra la tecla "Enter" en el teclado
          textInputAction: TextInputAction.newline,
          style: TextStyle(color: Theme.of(context).colorScheme.surface),

          decoration: InputDecoration(
            hintText: 'Escribe algo para comenzar...',
            hintStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.surface, // Color del texto de pista
            ),
            // Quitamos la línea molesta que Flutter pone por defecto abajo de los inputs
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            // Quitamos el padding extra de Flutter para tener control total con el Container
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
