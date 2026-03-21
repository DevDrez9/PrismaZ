import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ay.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ay'),
    Locale('es'),
  ];

  /// Nombre de la aplicación en la barra superior
  ///
  /// In es, this message translates to:
  /// **'Prisma Z'**
  String get home_appBarTitle;

  /// Mensaje de bienvenida en el banner superior
  ///
  /// In es, this message translates to:
  /// **'¡Hola! Aquí te acompaño'**
  String get home_welcomeMessage;

  /// Etiqueta del botón para el módulo de Chat Bot
  ///
  /// In es, this message translates to:
  /// **'Chat Bot'**
  String get home_cardChatBot;

  /// Etiqueta del botón para el módulo de Comunidad
  ///
  /// In es, this message translates to:
  /// **'Comunidad'**
  String get home_cardComunidad;

  /// Etiqueta del botón para el módulo de Derechos
  ///
  /// In es, this message translates to:
  /// **'Mis derechos'**
  String get home_cardMisDerechos;

  /// Boton para ir al mapa y ver comisarias
  ///
  /// In es, this message translates to:
  /// **'Estacion de policia mas cercano'**
  String get home_btnPolicia;

  /// Texto del boton de panico
  ///
  /// In es, this message translates to:
  /// **'Ayuda'**
  String get home_btnTimer;

  /// Texto del titulo del modulo
  ///
  /// In es, this message translates to:
  /// **'Tú guia de asistencia legal'**
  String get asis_appBar;

  /// Título principal de la pantalla de guía legal
  ///
  /// In es, this message translates to:
  /// **'Tu guía de acción legal'**
  String get legal_title;

  /// Texto instructivo de la parte superior
  ///
  /// In es, this message translates to:
  /// **'Si ha ocurrido algún accidente o tus derechos o integridad física fueron dañados o vulnerados explora los botones de acuerdo a tu necesidad. Recuerda primero buscar un lugar seguro.'**
  String get legal_intro_text;

  /// Botón con icono de corazón para ayuda rápida
  ///
  /// In es, this message translates to:
  /// **'Ayuda'**
  String get legal_btn_ayuda;

  /// Botón con icono de documento para iniciar denuncia
  ///
  /// In es, this message translates to:
  /// **'Crea una denuncia'**
  String get legal_btn_denuncia;

  /// Título de la sección de lista de contactos
  ///
  /// In es, this message translates to:
  /// **'Contactos legales'**
  String get legal_section_contacts;

  /// Botón pequeño verde para expandir contactos
  ///
  /// In es, this message translates to:
  /// **'Ver todos'**
  String get legal_btn_verTodos;

  /// No description provided for @legal_contact_name_placeholder.
  ///
  /// In es, this message translates to:
  /// **'Dra. Claudia Perez'**
  String get legal_contact_name_placeholder;

  /// No description provided for @legal_contact_specialty_placeholder.
  ///
  /// In es, this message translates to:
  /// **'Penalista, etc, etc'**
  String get legal_contact_specialty_placeholder;

  /// Pregunta antes del botón de pánico o emergencia
  ///
  /// In es, this message translates to:
  /// **'¿No puedes hablar?'**
  String get legal_footer_question;

  /// Botón rojo de acción urgente
  ///
  /// In es, this message translates to:
  /// **'HABLA POR MI'**
  String get legal_btn_hablaPorMi;

  /// Título de la pantalla de derechos
  ///
  /// In es, this message translates to:
  /// **'Mis Derechos Sexuales y Reproductivos'**
  String get der_titSex;

  /// Texto introductorio
  ///
  /// In es, this message translates to:
  /// **'Conocer tus derechos es el primer paso para tomar el control de tu vida. Aquí te explicamos de forma clara qué puedes decidir y exigir sobre tu cuerpo y tu sexualidad. ¡Tu autonomía es prioridad!'**
  String get der_intro;

  /// No description provided for @der_sex_1.
  ///
  /// In es, this message translates to:
  /// **'Libertad Sexual'**
  String get der_sex_1;

  /// No description provided for @der_sex_1_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes el poder de decidir cómo vivir y disfrutar tu sexualidad de forma libre, siempre que sea consensuada y no afecte los derechos de los demás. Nadie puede obligarte a hacer algo que no quieras.'**
  String get der_sex_1_content;

  /// No description provided for @der_sex_2.
  ///
  /// In es, this message translates to:
  /// **'Autonomía e Integridad de tu Cuerpo'**
  String get der_sex_2;

  /// No description provided for @der_sex_2_content.
  ///
  /// In es, this message translates to:
  /// **'Tú eres la única persona que decide sobre tu cuerpo. Tienes derecho a vivir sin miedo a la violencia, al acoso o a cualquier presión externa que intente controlar tus decisiones físicas.'**
  String get der_sex_2_content;

  /// No description provided for @der_sex_3.
  ///
  /// In es, this message translates to:
  /// **'Privacidad Sexual'**
  String get der_sex_3;

  /// No description provided for @der_sex_3_content.
  ///
  /// In es, this message translates to:
  /// **'Tus decisiones, conductas y preferencias sexuales pertenecen a tu ámbito íntimo. Tienes derecho a que se respete tu privacidad y a que nadie difunda información sobre tu vida sexual sin tu consentimiento.'**
  String get der_sex_3_content;

  /// No description provided for @der_sex_4.
  ///
  /// In es, this message translates to:
  /// **'Equidad y No Discriminación'**
  String get der_sex_4;

  /// No description provided for @der_sex_4_content.
  ///
  /// In es, this message translates to:
  /// **'Mereces vivir una vida plena sin importar tu sexo, identidad de género u orientación sexual. Tienes derecho a las mismas oportunidades y a estar protegido contra cualquier forma de rechazo o exclusión.'**
  String get der_sex_4_content;

  /// No description provided for @der_sex_5.
  ///
  /// In es, this message translates to:
  /// **'Placer Sexual'**
  String get der_sex_5;

  /// No description provided for @der_sex_5_content.
  ///
  /// In es, this message translates to:
  /// **'El placer es una parte natural y saludable de la vida. Tienes derecho a disfrutar de una sexualidad satisfactoria, segura y placentera, libre de culpas o imposiciones.'**
  String get der_sex_5_content;

  /// No description provided for @der_sex_6.
  ///
  /// In es, this message translates to:
  /// **'Expresión Emocional y Afectiva'**
  String get der_sex_6;

  /// No description provided for @der_sex_6_content.
  ///
  /// In es, this message translates to:
  /// **'La sexualidad no es solo contacto físico; también es afecto y comunicación. Tienes derecho a expresar tus sentimientos, amor y emociones de la forma que elijas, siempre en un marco de respeto mutuo.'**
  String get der_sex_6_content;

  /// No description provided for @der_sex_7.
  ///
  /// In es, this message translates to:
  /// **'Libre Asociación'**
  String get der_sex_7;

  /// No description provided for @der_sex_7_content.
  ///
  /// In es, this message translates to:
  /// **'Tú eliges con quién quieres compartir tu vida, tus afectos o tu sexualidad. Esto incluye decidir libremente si quieres casarte, vivir en unión libre o mantener cualquier tipo de relación sentimental.'**
  String get der_sex_7_content;

  /// No description provided for @der_sex_8.
  ///
  /// In es, this message translates to:
  /// **'Decisiones Reproductivas Libres'**
  String get der_sex_8;

  /// No description provided for @der_sex_8_content.
  ///
  /// In es, this message translates to:
  /// **'Es tu derecho decidir si quieres tener hijos o no, cuántos y en qué momento de tu vida. Esta elección debe ser voluntaria, responsable y libre de presiones sociales o familiares.'**
  String get der_sex_8_content;

  /// No description provided for @der_sex_9.
  ///
  /// In es, this message translates to:
  /// **'Información Científica y Objetiva'**
  String get der_sex_9;

  /// No description provided for @der_sex_9_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a recibir información sobre sexualidad que sea real, actualizada y basada en la ciencia, no en mitos, prejuicios o creencias religiosas que puedan confundirte.'**
  String get der_sex_9_content;

  /// No description provided for @der_sex_10.
  ///
  /// In es, this message translates to:
  /// **'Educación Integral en Sexualidad (EIS)'**
  String get der_sex_10;

  /// No description provided for @der_sex_10_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a recibir educación sexual desde joven. Esta formación debe ayudarte a entender tu cuerpo, tus emociones y a fortalecer tu capacidad de tomar decisiones informadas y responsables.'**
  String get der_sex_10_content;

  /// No description provided for @der_sex_11.
  ///
  /// In es, this message translates to:
  /// **'Atención a la Salud Sexual'**
  String get der_sex_11;

  /// No description provided for @der_sex_11_content.
  ///
  /// In es, this message translates to:
  /// **'Mereces servicios médicos de alta calidad. Tienes derecho a acceder a prevención, diagnósticos y tratamientos para cuidar tu salud sexual y reproductiva en un ambiente de confianza y respeto.'**
  String get der_sex_11_content;

  /// Título de la sección de derechos reproductivos
  ///
  /// In es, this message translates to:
  /// **'Derechos Reproductivos'**
  String get der_titRep;

  /// No description provided for @der_rep_1.
  ///
  /// In es, this message translates to:
  /// **'Decidir sobre la maternidad o paternidad'**
  String get der_rep_1;

  /// No description provided for @der_rep_1_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes la libertad total de elegir si quieres ser madre o padre, o si prefieres no serlo. Es una decisión personal y nadie puede presionarte para tomar un camino que no desees.'**
  String get der_rep_1_content;

  /// No description provided for @der_rep_2.
  ///
  /// In es, this message translates to:
  /// **'Planificación de tu familia'**
  String get der_rep_2;

  /// No description provided for @der_rep_2_content.
  ///
  /// In es, this message translates to:
  /// **'Tú decides cuántos hijos quieres tener (si es que quieres) y cuánto tiempo dejar pasar entre uno y otro. Tienes derecho a planificar tu vida a tu propio ritmo, sin imposiciones externas.'**
  String get der_rep_2_content;

  /// No description provided for @der_rep_3.
  ///
  /// In es, this message translates to:
  /// **'Acceso a métodos anticonceptivos'**
  String get der_rep_3;

  /// No description provided for @der_rep_3_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a recibir métodos anticonceptivos que sean seguros, efectivos y fáciles de conseguir. El sistema de salud debe garantizar que el método que elijas esté disponible y sea aceptable para ti.'**
  String get der_rep_3_content;

  /// No description provided for @der_rep_4.
  ///
  /// In es, this message translates to:
  /// **'Maternidad Segura'**
  String get der_rep_4;

  /// No description provided for @der_rep_4_content.
  ///
  /// In es, this message translates to:
  /// **'Si decides tener un hijo, tienes derecho a recibir atención médica de calidad durante todo el proceso: el embarazo, el parto y los cuidados después del nacimiento (posparto) para proteger tu vida y tu salud.'**
  String get der_rep_4_content;

  /// No description provided for @der_rep_5.
  ///
  /// In es, this message translates to:
  /// **'Servicios de Salud Reproductiva'**
  String get der_rep_5;

  /// No description provided for @der_rep_5_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a una atención integral que incluya desde la prevención de enfermedades hasta el tratamiento si tienes dificultades para concebir (infertilidad). La salud reproductiva va más allá de solo tener hijos.'**
  String get der_rep_5_content;

  /// No description provided for @der_rep_6.
  ///
  /// In es, this message translates to:
  /// **'Beneficios del Progreso Científico'**
  String get der_rep_6;

  /// No description provided for @der_rep_6_content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a beneficiarte de los avances de la ciencia. Esto significa tener acceso a las tecnologías y tratamientos más modernos y seguros que existan en el área de la salud reproductiva.'**
  String get der_rep_6_content;

  /// No description provided for @der_rep_7.
  ///
  /// In es, this message translates to:
  /// **'Interrupción Legal del Embarazo (ILE)'**
  String get der_rep_7;

  /// No description provided for @der_rep_7_content.
  ///
  /// In es, this message translates to:
  /// **'En Bolivia, tienes derecho a acceder a un aborto seguro y legal bajo las causales permitidas por la ley y la Sentencia Constitucional 0206/2014 (como casos de violación, incesto, estupro o cuando la vida o salud de la mujer corre peligro). Es un servicio que el sistema de salud debe garantizarte con respeto y sin prejuicios.'**
  String get der_rep_7_content;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ay', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ay':
      return AppLocalizationsAy();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
