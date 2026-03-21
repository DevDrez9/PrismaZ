import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> opciones;
  final String hint;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.opciones,
    required this.hint,
    required this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

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
          // Quita la línea molesta por defecto
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              widget.hint,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            isExpanded: true, // Hace que ocupe todo el ancho
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.primary,
            ),
            dropdownColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest, // Color del menú al abrirse
            borderRadius: BorderRadius.circular(
              15,
            ), // Bordes del menú desplegable
            items: widget.opciones.map((String valor) {
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
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
              widget.onChanged(newValue);
            },
          ),
        ),
      ),
    );
  }
}
