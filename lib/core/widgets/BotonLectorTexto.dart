import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BotonLectorTexto extends StatefulWidget {
  final String textoALeer;

  const BotonLectorTexto({super.key, required this.textoALeer});

  @override
  State<BotonLectorTexto> createState() => _BotonLectorTextoState();
}

class _BotonLectorTextoState extends State<BotonLectorTexto> {
  final FlutterTts flutterTts = FlutterTts();
  bool _estaHablando = false;

  @override
  void initState() {
    super.initState();
    _configurarTTS();
  }

  // Configuramos el idioma, la velocidad y el tono
  Future<void> _configurarTTS() async {
    await flutterTts.setLanguage(
      "es-ES",
    ); // Puedes usar "es-US" o "es-BO" dependiendo de la voz que busques
    await flutterTts.setSpeechRate(0.5); // Velocidad (0.0 a 1.0)
    await flutterTts.setVolume(1.0); // Volumen máximo
    await flutterTts.setPitch(1.0); // Tono normal

    // Esto nos avisa cuando el audio termina de reproducirse naturalmente
    flutterTts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          _estaHablando = false;
        });
      }
    });
  }

  // Lógica principal: Hablar o Detener
  Future<void> _hablarOParar() async {
    if (_estaHablando) {
      await flutterTts.stop();
      setState(() {
        _estaHablando = false;
      });
    } else {
      setState(() {
        _estaHablando = true;
      });
      // Le pasamos el texto que recibimos en el constructor
      await flutterTts.speak(widget.textoALeer);
    }
  }

  @override
  void dispose() {
    flutterTts
        .stop(); // ¡Vital! Detiene el audio si el usuario cambia de pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _hablarOParar,
      // Cambiamos el ícono visualmente según el estado
      icon: Icon(_estaHablando ? Icons.stop_circle : Icons.volume_up),
      label: Text(_estaHablando ? 'Detener lectura' : 'Escuchar texto'),
      style: ElevatedButton.styleFrom(
        // Le damos un toque rojizo si está hablando para indicar que el botón ahora sirve para "Detener"
        backgroundColor: _estaHablando
            ? Colors.red[100]
            : Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: _estaHablando
            ? Colors.red[900]
            : Theme.of(context).colorScheme.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
