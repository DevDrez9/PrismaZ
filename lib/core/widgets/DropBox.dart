import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> opciones;
  final String hint;
  final String? value; // 1. ¡ESTO ES VITAL! Debe recibir el valor del padre
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.opciones,
    required this.hint,
    required this.onChanged,
    this.value, // 2. Pedimos el valor de forma opcional
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      color: Theme.of(context).colorScheme.primaryContainer,
      opacity: 0.8,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: AppTheme.getMainWidth80(context),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            // 3. ¡AQUÍ ESTÁ LA MAGIA! Le pasamos la variable al botón nativo
            value: value,

            hint: Text(
              hint,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.primary,
            ),
            dropdownColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(15),
            items: opciones.map((String valor) {
              return DropdownMenuItem<String>(
                value: valor,
                child: Text(
                  valor,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
