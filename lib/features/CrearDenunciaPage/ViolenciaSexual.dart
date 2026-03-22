import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/CustomToggleSwitch.dart';
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class ViolenciaSexual extends StatefulWidget {
  const ViolenciaSexual({super.key});

  @override
  State<ViolenciaSexual> createState() => _ViolenciaSexualState();
}

class _ViolenciaSexualState extends State<ViolenciaSexual> {
  // 1. ¡LA SOLUCIÓN! Mueve la variable aquí arriba, fuera del build.
  // De esta manera, Flutter no la reiniciará cada vez que la pantalla se actualice.
  bool denunciar = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          children: [
            Container(child: Text(l10n.drop_der1_intro)),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomToggleSwitch(
                textoIzquierda: "Quiero denunciar",
                textoDerecha: "Quiero ir al doctor",
                onChanged: (bool valorSeleccionado) {
                  setState(() {
                    // Si el componente te devuelve true (Presets/Izquierda), denunciar es true
                    // Si te devuelve false (Escribe tú/Derecha), denunciar es false
                    denunciar = valorSeleccionado;
                  });

                  // Comprobación en consola
                  if (denunciar) {
                    print("El usuario quiere denunciar");
                  } else {
                    print("El usuario quiere ir al doctor");
                  }
                },
              ),
            ),

            // 2. Aquí está tu renderizado condicional, que ahora sí funcionará
            denunciar == true
                ? Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        l10n.drop_der1_derSex_paso1,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.inverseSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        child: SvgPicture.asset(
                          "assets/undraw_location-search_nesh.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(l10n.drop_der1_derSex_paso1_content),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PoliciaPage(),
                            ),
                          ),
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffa5d6a7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: Color(0xff0b300d)),
                              Text(
                                "FELCV",
                                style: TextStyle(
                                  color: Color(0xff0b300d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      titulo(l10n.drop_der1_derSex_paso2, context),
                      SizedBox(height: 10),
                      Text(l10n.drop_der1_derSex_paso2_content),

                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          "assets/undraw_personal-info_yzls.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      titulo(l10n.drop_der1_derSex_paso3, context),
                      SizedBox(height: 10),
                      Text(l10n.drop_der1_derSex_paso3_content),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PoliciaPage(),
                            ),
                          ),
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffa5d6a7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital_sharp,
                                color: Color(0xff0b300d),
                              ),
                              Text(
                                "Centro de Salud",
                                style: TextStyle(
                                  color: Color(0xff0b300d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: 10),
                      titulo(l10n.drop_der1_derRep_paso1, context),
                      SizedBox(height: 10),
                      Text(l10n.drop_der1_derRep_paso1_content),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PoliciaPage(),
                            ),
                          ),
                        },

                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffa5d6a7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital_sharp,
                                color: Color(0xff0b300d),
                              ),
                              Text(
                                "Centro de Salud",
                                style: TextStyle(
                                  color: Color(0xff0b300d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      titulo(l10n.drop_der1_derRep_paso2, context),
                      SizedBox(height: 10),
                      Text(l10n.drop_der1_derRep_paso2_content),
                      SizedBox(height: 20),
                      SizedBox(height: 10),
                      titulo(l10n.drop_der1_derRep_paso3, context),
                      SizedBox(height: 10),
                      Text(l10n.drop_der1_derRep_paso3_content),

                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          "assets/undraw_judge_hyqv.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ), // Esta es la vista del doctor
          ],
        ),
      ),
    );
  }
}

Widget titulo(String titulo, BuildContext context) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
      titulo,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).colorScheme.inverseSurface,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
