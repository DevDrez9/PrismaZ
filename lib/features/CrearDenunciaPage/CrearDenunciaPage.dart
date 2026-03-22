import 'package:flutter/material.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/DropBox.dart';
import 'package:salud_apps/features/CrearDenunciaPage/ILEPage.dart';
import 'package:salud_apps/features/CrearDenunciaPage/ViolenciaSexual.dart';
import 'package:salud_apps/features/SaludEducacion/DerechoInfo.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

// 1. MODIFICAMOS EL WIDGET PARA RECIBIR EL ID (Opcional)
class CrearDenunciaPage extends StatefulWidget {
  final int? idPreseleccionado; // Creamos la variable que recibirá el ID

  const CrearDenunciaPage({
    super.key,
    this.idPreseleccionado, // Lo pedimos en el constructor (puede ser null)
  });

  @override
  State<CrearDenunciaPage> createState() => _CrearDenunciaPageState();
}

class _CrearDenunciaPageState extends State<CrearDenunciaPage> {
  DerechoInfo? derechoSeleccionado;

  // 2. SACAMOS LAS VARIABLES DEL BUILD
  // Usamos 'late' porque las llenaremos en el initState
  late List<OpcionesDenuncia> listaDerechos;
  // Es mejor inicializar el seleccionado como null cuando no hay nada elegido
  OpcionesDenuncia? denunciaSelect;

  @override
  void initState() {
    super.initState();

    // Inicializamos nuestra lista de datos
    listaDerechos = [
      OpcionesDenuncia(id: 1, nombre: "Violencia sexual"),
      OpcionesDenuncia(
        id: 2,
        nombre: "Intervencion Legal del Embarazo",
      ), // Ojo: Puse IDs únicos
      OpcionesDenuncia(id: 3, nombre: "Discriminacion"),
    ];

    // 3. ¡LA MAGIA DE LA PRE-SELECCIÓN!
    // Si llegó un ID desde la otra pantalla, lo buscamos y lo asignamos
    if (widget.idPreseleccionado != null) {
      try {
        denunciaSelect = listaDerechos.firstWhere(
          (derecho) => derecho.id == widget.idPreseleccionado,
        );

        // NOTA: Si necesitas que también aparezca la tarjeta de información abajo
        // automáticamente, deberías cargar 'derechoSeleccionado' aquí también.
      } catch (e) {
        // Si por alguna razón envían un ID que no existe (ej. 99), no hacemos nada
        denunciaSelect = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;

    // Solo extraemos los nombres para pasarlos al CustomDropdown
    final List<String> opcionesDropdown = listaDerechos
        .map((d) => d.nombre)
        .toList();

    Widget mostrarSelec() {
      if (denunciaSelect == null) {
        return Container();

        // O si prefieres mostrar un mensaje amigable, puedes usar esto en su lugar:
        // return const Center(child: Text('Selecciona una opción arriba'));
      }
      if (denunciaSelect!.id == 1) {
        return ViolenciaSexual();
      } else if (denunciaSelect!.id == 2) {
        return ILEPage();
      } else if (denunciaSelect!.id == 3) {
        return Container();
      } else {
        return Container();
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          // ... (Tus botones de idioma, notificaciones y perfil se quedan igual) ...
        ],
      ),
      body: Stack(
        children: [
          // Capa 1: La imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  esTemaOscuro
                      ? 'assets/background_dark.png'
                      : 'assets/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa 2: Tu contenido real
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Center(
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: 300,
                      child: Text(
                        "El paso cero",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.inverseSurface,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // 4. EL DROPDOWN AHORA LEE EL ESTADO CORRECTO
                  CustomDropdown(
                    opciones: opcionesDropdown,
                    hint: "¿Qué quieres explorar hoy?",
                    // Le pasamos el nombre si existe, o null si no se ha elegido nada
                    value: denunciaSelect?.nombre,
                    onChanged: (valorSeleccionado) {
                      setState(() {
                        if (valorSeleccionado != null) {
                          denunciaSelect = listaDerechos.firstWhere(
                            (derecho) => derecho.nombre == valorSeleccionado,
                          );

                          // Aquí asumo que cargas la información para la tarjeta de abajo
                          // derechoSeleccionado = ...
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  mostrarSelec(),

                  // ... (El resto de tu código de la tarjeta de información se queda igual) ...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OpcionesDenuncia {
  int id;
  String nombre;
  OpcionesDenuncia({required this.id, required this.nombre});
}
