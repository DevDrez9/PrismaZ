import 'dart:async';
import 'dart:math' as math; // Necesario para calcular el tamaño dinámico
import 'package:flutter/material.dart';

class BreathingExerciseWidget extends StatefulWidget {
  const BreathingExerciseWidget({super.key});

  @override
  State<BreathingExerciseWidget> createState() =>
      _BreathingExerciseWidgetState();
}

class _BreathingExerciseWidgetState extends State<BreathingExerciseWidget>
    with TickerProviderStateMixin {
  bool _isPressing = false;
  String _breathingInstruction = 'Inhala suavemente...';
  late AnimationController _animationController;
  late Animation<double> _animationProgress; // Ahora va de 0.0 a 1.0
  late Animation<double> _animationOpacity;

  final Color _palePink = const Color(0xFFFFF1F1);
  final Color _paleLavender = const Color(0xFFE5E5F7);
  final Color _vibrantRed = const Color(0xFFE63946);
  final Color _breathingCircleColor = const Color.fromARGB(255, 248, 29, 29);
  final Color _purpleTextIcon = const Color(0xFF7B5FA6);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // En lugar de tamaños fijos, la animación solo controla el progreso (0% a 100%)
    _animationProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationOpacity = Tween<double>(begin: 0.6, end: 0.6).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        if (_isPressing) {
          setState(() {
            _breathingInstruction = 'Inhala suavemente...';
          });
        }
      } else if (status == AnimationStatus.reverse) {
        if (_isPressing) {
          setState(() {
            _breathingInstruction = 'Exhala suavemente...';
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startBreathingLoop() {
    _animationController.repeat(reverse: true);
  }

  void _stopBreathingLoop() {
    _animationController.stop();
    _animationController.reset();
    setState(() {
      _breathingInstruction = 'Inhala suavemente...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: _palePink,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Usamos Expanded para que la animación tome el espacio disponible,
            // dejando lugar para el botón de abajo sin desbordarse.
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculamos el tamaño máximo posible sin salirnos de los bordes
                  final maxCircleSize = math.min(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  );
                  const minCircleSize = 100.0; // Tamaño del botón rojo

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Círculo que respira
                      AnimatedBuilder(
                        animation: _animationProgress,
                        builder: (context, child) {
                          // El tamaño se calcula dinámicamente:
                          // Tamaño base + (Espacio disponible * Progreso de animación)
                          final currentSize =
                              minCircleSize +
                              ((maxCircleSize - minCircleSize) *
                                  _animationProgress.value);

                          return Opacity(
                            opacity: _animationOpacity.value,
                            child: Container(
                              width: currentSize,
                              height: currentSize,
                              decoration: BoxDecoration(
                                color: _breathingCircleColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        },
                      ),
                      // Botón rojo central
                      GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            _isPressing = true;
                            _startBreathingLoop();
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            _isPressing = false;
                            _stopBreathingLoop();
                          });
                        },
                        onTapCancel: () {
                          setState(() {
                            _isPressing = false;
                            _stopBreathingLoop();
                          });
                        },
                        child: Container(
                          width: minCircleSize,
                          height: minCircleSize,
                          decoration: BoxDecoration(
                            color: _vibrantRed,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Botón inferior
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: _paleLavender,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isPressing ? Icons.favorite : Icons.play_arrow_outlined,
                    color: _purpleTextIcon,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _isPressing ? _breathingInstruction : 'Iniciar respiración',
                    style: TextStyle(
                      color: _purpleTextIcon,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
