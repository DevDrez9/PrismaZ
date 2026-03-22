import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/CustomToggleSwitch.dart';
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class ILEPage extends StatefulWidget {
  const ILEPage({super.key});

  @override
  State<ILEPage> createState() => _ILEPageState();
}

class _ILEPageState extends State<ILEPage> {
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
            Container(child: Text(l10n.ile_definition)),
            SizedBox(height: 25),
            titulo(l10n.ile_req_title, context),
            SizedBox(height: 10),
            Text(l10n.ile_req_content),
            SizedBox(height: 25),
            titulo(l10n.ile_extra_info_title, context),
            SizedBox(height: 10),
            Text(l10n.ile_extra_info_points),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/undraw_expecting_j6le.svg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Text(l10n.ile_footer),
            SizedBox(height: 50),
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
