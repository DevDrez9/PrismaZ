import 'package:flutter/material.dart';
// import 'package:salud_apps/core/widgets/CardRectangulo.dart'; // (Asegúrate de que esta importación se use si es necesaria)

class CustomToggleSwitch extends StatefulWidget {
  final Function(bool isPreset) onChanged;

  // 1. Agregamos las dos variables para los textos
  final String textoIzquierda;
  final String textoDerecha;

  const CustomToggleSwitch({
    super.key,
    required this.onChanged,
    required this.textoIzquierda, // 2. Los pedimos como requeridos en el constructor
    required this.textoDerecha,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  // Variable interna que controla cuál está seleccionado.
  // true = Opción Izquierda, false = Opción Derecha
  bool isPresetSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // --- BOTÓN 1: IZQUIERDA ---
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isPresetSelected) {
                  setState(() {
                    isPresetSelected = true;
                  });
                  widget.onChanged(true);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isPresetSelected
                      ? Colors.grey[400]
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget
                      .textoIzquierda, // 3. Usamos la variable del widget padre
                  style: TextStyle(
                    color: isPresetSelected ? Colors.black87 : Colors.black54,
                    fontWeight: isPresetSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

          // --- BOTÓN 2: DERECHA ---
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isPresetSelected) {
                  setState(() {
                    isPresetSelected = false;
                  });
                  widget.onChanged(false);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: !isPresetSelected
                      ? Colors.grey[400]
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.textoDerecha, // 4. Usamos la variable del widget padre
                  style: TextStyle(
                    color: !isPresetSelected ? Colors.black87 : Colors.black54,
                    fontWeight: !isPresetSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
