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

  /// Nombre de la app en la barra superior
  ///
  /// In es, this message translates to:
  /// **'Yanapiri'**
  String get home_appBarTittle;

  /// No description provided for @home_asistencia.
  ///
  /// In es, this message translates to:
  /// **'Asesoria legal'**
  String get home_asistencia;

  /// No description provided for @home_asistencia_sub1.
  ///
  /// In es, this message translates to:
  /// **'• Violencia Sexual'**
  String get home_asistencia_sub1;

  /// No description provided for @home_asistencia_sub2.
  ///
  /// In es, this message translates to:
  /// **'• ILE'**
  String get home_asistencia_sub2;

  /// No description provided for @home_chatBot.
  ///
  /// In es, this message translates to:
  /// **'Chat Bot'**
  String get home_chatBot;

  /// No description provided for @home_aprender.
  ///
  /// In es, this message translates to:
  /// **'Aprender'**
  String get home_aprender;

  /// No description provided for @home_comunidad.
  ///
  /// In es, this message translates to:
  /// **'Comunidad'**
  String get home_comunidad;

  /// Texto del botón amarillo
  ///
  /// In es, this message translates to:
  /// **'Estacion de Policias mas cercanos'**
  String get home_policia;

  /// Texto del botón turquesa inferior
  ///
  /// In es, this message translates to:
  /// **'Quiero calmarme'**
  String get home_quieroCalma;

  /// No description provided for @home_btProtocolo.
  ///
  /// In es, this message translates to:
  /// **'Protocolo de 72 horas'**
  String get home_btProtocolo;

  /// No description provided for @home_btProtocolo_desc.
  ///
  /// In es, this message translates to:
  /// **'(En casos de violencia Sexual)'**
  String get home_btProtocolo_desc;

  /// No description provided for @modaa_title.
  ///
  /// In es, this message translates to:
  /// **'Estamos aqui para ti \n ¿Qué tipo de ayuda necesitas?'**
  String get modaa_title;

  /// No description provided for @modal_btn1.
  ///
  /// In es, this message translates to:
  /// **'Quiero calmarme'**
  String get modal_btn1;

  /// No description provided for @modal_btn1_desc.
  ///
  /// In es, this message translates to:
  /// **'(Contención emocional)'**
  String get modal_btn1_desc;

  /// No description provided for @modal_btn2.
  ///
  /// In es, this message translates to:
  /// **'Fui Victima de violencia sexual'**
  String get modal_btn2;

  /// No description provided for @modal_btn2_desc.
  ///
  /// In es, this message translates to:
  /// **'(Guia de 72 horas)'**
  String get modal_btn2_desc;

  /// No description provided for @modal_btn3.
  ///
  /// In es, this message translates to:
  /// **'Explorar App'**
  String get modal_btn3;

  /// No description provided for @modal_btn3_desc.
  ///
  /// In es, this message translates to:
  /// **'(Asistencia Legal)'**
  String get modal_btn3_desc;

  /// No description provided for @protocol_title.
  ///
  /// In es, this message translates to:
  /// **'Protocolo de 72 horas'**
  String get protocol_title;

  /// No description provided for @protocol_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Estamos aqui para acompañarte.\nCada paso que tomes es valioso y estamos para guiarte a tu bienestar y obtener justicia.'**
  String get protocol_subtitle;

  /// No description provided for @procotol_car1.
  ///
  /// In es, this message translates to:
  /// **'Antes de 72 horas'**
  String get procotol_car1;

  /// No description provided for @protocol_card2.
  ///
  /// In es, this message translates to:
  /// **'Después de 72 horas'**
  String get protocol_card2;

  /// No description provided for @protocol_btnContacotsEmmergencia.
  ///
  /// In es, this message translates to:
  /// **'Contactos de emergencia'**
  String get protocol_btnContacotsEmmergencia;

  /// No description provided for @emergencia_titulo.
  ///
  /// In es, this message translates to:
  /// **'Contactos de emergencia'**
  String get emergencia_titulo;

  /// No description provided for @emergencia_subtitulo.
  ///
  /// In es, this message translates to:
  /// **'Si te encuentras en una situación de riesgo, comunícate inmediatamente con estas instituciones. Tu seguridad es lo más importante.'**
  String get emergencia_subtitulo;

  /// No description provided for @emergecia_card1.
  ///
  /// In es, this message translates to:
  /// **'Emergencias Policiales'**
  String get emergecia_card1;

  /// No description provided for @emergencia_card1_desc.
  ///
  /// In es, this message translates to:
  /// **'Llama al 911 para asistencia inmediata.'**
  String get emergencia_card1_desc;

  /// No description provided for @emergencia_card2.
  ///
  /// In es, this message translates to:
  /// **'Línea de Violencia contra la Mujer'**
  String get emergencia_card2;

  /// No description provided for @emergencia_card2_desc.
  ///
  /// In es, this message translates to:
  /// **'Llama al 800-10-1111 para apoyo especializado.'**
  String get emergencia_card2_desc;

  /// No description provided for @emergencia_card3.
  ///
  /// In es, this message translates to:
  /// **'Línea de Salud Sexual'**
  String get emergencia_card3;

  /// No description provided for @emergencia_card3_desc.
  ///
  /// In es, this message translates to:
  /// **'Llama al 800-10-8004 para información y asesoría sobre salud sexual.'**
  String get emergencia_card3_desc;

  /// No description provided for @antes_de_72h.
  ///
  /// In es, this message translates to:
  /// **'Antes de 72 horas'**
  String get antes_de_72h;

  /// No description provided for @antes_de_72h_fase1.
  ///
  /// In es, this message translates to:
  /// **'Fase 1: Accion Inmediata'**
  String get antes_de_72h_fase1;

  /// No description provided for @antes_de_72h_adv.
  ///
  /// In es, this message translates to:
  /// **'Preservacion de Evidencia (Vital)'**
  String get antes_de_72h_adv;

  /// No description provided for @antes_de_72h_card1.
  ///
  /// In es, this message translates to:
  /// **'NO te bañes'**
  String get antes_de_72h_card1;

  /// No description provided for @antes_de_72h_card2.
  ///
  /// In es, this message translates to:
  /// **'NO lavarse los dientes no cortarse las uñas'**
  String get antes_de_72h_card2;

  /// No description provided for @antes_de_72h_card3.
  ///
  /// In es, this message translates to:
  /// **'NO cambies tu ropa'**
  String get antes_de_72h_card3;

  /// No description provided for @antes_de_72h_card3_desc.
  ///
  /// In es, this message translates to:
  /// **'(Si es posible, guárdala en una bolsa)'**
  String get antes_de_72h_card3_desc;

  /// No description provided for @antes_de_72h_card4.
  ///
  /// In es, this message translates to:
  /// **'NO limpiar la escena del delito'**
  String get antes_de_72h_card4;

  /// No description provided for @antes_de_72h_fase2.
  ///
  /// In es, this message translates to:
  /// **'Fase 2: A donde ir'**
  String get antes_de_72h_fase2;

  /// No description provided for @antes_de_72h_fase2_card1.
  ///
  /// In es, this message translates to:
  /// **'Centro de Salud'**
  String get antes_de_72h_fase2_card1;

  /// No description provided for @antes_de_72h_fase2_card1_prioridad.
  ///
  /// In es, this message translates to:
  /// **'Prioridad'**
  String get antes_de_72h_fase2_card1_prioridad;

  /// No description provided for @antes_de_72h_fase2_card1_desc.
  ///
  /// In es, this message translates to:
  /// **'Solicita el Kit PPE (Profilaxis Post-Exposición) para prevenir infecciones y embarazo. No requiere denuncia previa.'**
  String get antes_de_72h_fase2_card1_desc;

  /// No description provided for @antes_de_72h_fase2_card1_btn.
  ///
  /// In es, this message translates to:
  /// **'Ir ahora'**
  String get antes_de_72h_fase2_card1_btn;

  /// No description provided for @antes_de_72h_fase3.
  ///
  /// In es, this message translates to:
  /// **'Ellos haran la denuncia por ti'**
  String get antes_de_72h_fase3;

  /// No description provided for @antes_de_72h_fase3_desc.
  ///
  /// In es, this message translates to:
  /// **'El personal médico tiene la obligación de reportar el delito a las autoridades y darte toda la atención que necesitas.'**
  String get antes_de_72h_fase3_desc;

  /// No description provided for @despues72h.
  ///
  /// In es, this message translates to:
  /// **'Después de 72 horas'**
  String get despues72h;

  /// No description provided for @despues72h_desc.
  ///
  /// In es, this message translates to:
  /// **'Pasadas las 72 horas, el enfoque se desplaza hacia tu recuperación integral y el ejercicio de tu autonomía.'**
  String get despues72h_desc;

  /// No description provided for @despues72h_tit1.
  ///
  /// In es, this message translates to:
  /// **'Atención Médica Integral'**
  String get despues72h_tit1;

  /// No description provided for @despues72h_tit1_card1_tit.
  ///
  /// In es, this message translates to:
  /// **'Pruebas Diagnosticas'**
  String get despues72h_tit1_card1_tit;

  /// No description provided for @despues72h_tit1_card1_desc.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento de VIH, Hepatitis y otras ITS. Es vital completar los ciclos de análisis recomendados.'**
  String get despues72h_tit1_card1_desc;

  /// No description provided for @despues72h_tit1_card2_tit.
  ///
  /// In es, this message translates to:
  /// **'Tratamiento de lesiones'**
  String get despues72h_tit1_card2_tit;

  /// No description provided for @despues72h_tit1_card2_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuidado de secuelas físicas y derivación a especialistas si es necesario.'**
  String get despues72h_tit1_card2_desc;

  /// No description provided for @despues72h_card_apoyo.
  ///
  /// In es, this message translates to:
  /// **'Derechos Reproductivos I.L.E'**
  String get despues72h_card_apoyo;

  /// No description provided for @despues72h_card_apoyo_link.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a la interrupción legal del embarazo (ILE).'**
  String get despues72h_card_apoyo_link;

  /// No description provided for @despues72h_subCard_tit.
  ///
  /// In es, this message translates to:
  /// **'En caso de Violencia Sexual'**
  String get despues72h_subCard_tit;

  /// No description provided for @despues72h_subCard_desc.
  ///
  /// In es, this message translates to:
  /// **'• No se requiere orden Judicial \n'**
  String get despues72h_subCard_desc;

  /// No description provided for @despues72h_subCard_desc2.
  ///
  /// In es, this message translates to:
  /// **'• Solo es necesaria la copia de la Denuncia Policial \n'**
  String get despues72h_subCard_desc2;

  /// No description provided for @despues72h_tit2.
  ///
  /// In es, this message translates to:
  /// **'Proceso Legal y Denuncia'**
  String get despues72h_tit2;

  /// No description provided for @despues72h_tit2_desc.
  ///
  /// In es, this message translates to:
  /// **'Puedes acudir a cualquiera de estas instituciones para denunciar:\n  • FELCV.\n  • Fiscalía o Ministerio Público.\n  • Autoridades de tu comunidad.\n También puedes buscar apoyo en:\n  • SLIM, Defensorías (DNA) o SIJPLU.'**
  String get despues72h_tit2_desc;

  /// No description provided for @despues72h_tit2_btn.
  ///
  /// In es, this message translates to:
  /// **'FELCV'**
  String get despues72h_tit2_btn;

  /// No description provided for @despues72h_tit3.
  ///
  /// In es, this message translates to:
  /// **'Exige tu copia'**
  String get despues72h_tit3;

  /// No description provided for @despues72h_tit3_desc.
  ///
  /// In es, this message translates to:
  /// **'Una vez que hagas la denuncia, exige que te entreguen una copia de la denuncia. Este documento es tuyo, es tu derecho y lo necesitarás más adelante.'**
  String get despues72h_tit3_desc;

  /// No description provided for @despues72h_subCard2.
  ///
  /// In es, this message translates to:
  /// **'Ayuda Psicologica'**
  String get despues72h_subCard2;

  /// No description provided for @despues72h_subCard2_desc.
  ///
  /// In es, this message translates to:
  /// **'El impacto emocional puede aparecer días después. No estás sola. Busca apoyo en redes de contención especializada.'**
  String get despues72h_subCard2_desc;

  /// No description provided for @card_1.
  ///
  /// In es, this message translates to:
  /// **'Violencia Sexual'**
  String get card_1;

  /// No description provided for @card_2.
  ///
  /// In es, this message translates to:
  /// **'I.L.E'**
  String get card_2;

  /// No description provided for @card_3.
  ///
  /// In es, this message translates to:
  /// **'Discriminacion en Salud'**
  String get card_3;

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

  /// No description provided for @drop_der1.
  ///
  /// In es, this message translates to:
  /// **'¿Qué hacer si viviste violencia sexual?'**
  String get drop_der1;

  /// No description provided for @drop_der1_intro.
  ///
  /// In es, this message translates to:
  /// **'¡No estás sola/o! La violencia es un delito. Antes de elegir qué hacer, hay algo muy importante que debes saber: No te bañes ni botes la ropa que tenías puesta en ese momento. Sabemos que es difícil, pero esto servirá como prueba para el juicio contra tu agresor.'**
  String get drop_der1_intro;

  /// No description provided for @drop_der1_derSex.
  ///
  /// In es, this message translates to:
  /// **'Quiero denunciar primero.'**
  String get drop_der1_derSex;

  /// No description provided for @drop_der1_derSex_paso1.
  ///
  /// In es, this message translates to:
  /// **'Paso 1: Busca ayuda y presenta tu denuncia'**
  String get drop_der1_derSex_paso1;

  /// No description provided for @drop_der1_derSex_paso1_content.
  ///
  /// In es, this message translates to:
  /// **'Puedes acudir a cualquiera de estas instituciones para denunciar:\n• FELCV (Fuerza Especial de Lucha contra la Violencia).\n• Fiscalía o Ministerio Público.\n• Autoridades de tu comunidad (área rural).\n\nTambién puedes buscar apoyo en: SLIM, Defensorías (DNA) o SIJPLU.'**
  String get drop_der1_derSex_paso1_content;

  /// No description provided for @drop_der1_derSex_paso1_btn.
  ///
  /// In es, this message translates to:
  /// **'Buscar estación policial más cercana'**
  String get drop_der1_derSex_paso1_btn;

  /// No description provided for @drop_der1_derSex_paso2.
  ///
  /// In es, this message translates to:
  /// **'Paso 2: Exige tu copia'**
  String get drop_der1_derSex_paso2;

  /// No description provided for @drop_der1_derSex_paso2_content.
  ///
  /// In es, this message translates to:
  /// **'Una vez que hagas la denuncia, exige que te entreguen una copia. Este documento es tuyo, es tu derecho y lo necesitarás más adelante.'**
  String get drop_der1_derSex_paso2_content;

  /// No description provided for @drop_der1_derSex_paso3.
  ///
  /// In es, this message translates to:
  /// **'Paso 3: Ve al centro de salud'**
  String get drop_der1_derSex_paso3;

  /// No description provided for @drop_der1_derSex_paso3_content.
  ///
  /// In es, this message translates to:
  /// **'Las autoridades te derivarán a un servicio de salud para que te curen y te protejan.'**
  String get drop_der1_derSex_paso3_content;

  /// No description provided for @drop_der1_derSex_paso3_btn.
  ///
  /// In es, this message translates to:
  /// **'Buscar Centro de Salud más cercano'**
  String get drop_der1_derSex_paso3_btn;

  /// No description provided for @drop_der1_derRep.
  ///
  /// In es, this message translates to:
  /// **'Necesito ir a un médico primero.'**
  String get drop_der1_derRep;

  /// No description provided for @drop_der1_derRep_paso1.
  ///
  /// In es, this message translates to:
  /// **'Paso 1: Ve directamente a un centro de salud'**
  String get drop_der1_derRep_paso1;

  /// No description provided for @drop_der1_derRep_paso1_content.
  ///
  /// In es, this message translates to:
  /// **'Si te sientes mal, herida o prefieres ver a un médico antes de ir a la policía, acude a cualquier establecimiento de salud.'**
  String get drop_der1_derRep_paso1_content;

  /// No description provided for @drop_der1_derRep_paso1_btn.
  ///
  /// In es, this message translates to:
  /// **'Buscar Centro de Salud'**
  String get drop_der1_derRep_paso1_btn;

  /// No description provided for @drop_der1_derRep_paso2.
  ///
  /// In es, this message translates to:
  /// **'Paso 2: Recibe atención médica'**
  String get drop_der1_derRep_paso2;

  /// No description provided for @drop_der1_derRep_paso2_content.
  ///
  /// In es, this message translates to:
  /// **'Allí curarán tus heridas, te darán apoyo psicológico y tomarán las muestras necesarias para el proceso judicial.'**
  String get drop_der1_derRep_paso2_content;

  /// No description provided for @drop_der1_derRep_paso3.
  ///
  /// In es, this message translates to:
  /// **'Paso 3: Ellos harán la denuncia por ti'**
  String get drop_der1_derRep_paso3;

  /// No description provided for @drop_der1_derRep_paso3_content.
  ///
  /// In es, this message translates to:
  /// **'El personal médico tiene la obligación de reportar el delito a las autoridades y darte toda la atención que necesitas.'**
  String get drop_der1_derRep_paso3_content;

  /// No description provided for @drop_der1_infoMed_title.
  ///
  /// In es, this message translates to:
  /// **'¿Qué pasará en el centro de salud?'**
  String get drop_der1_infoMed_title;

  /// No description provided for @drop_der1_infoMed_72h_low.
  ///
  /// In es, this message translates to:
  /// **'Si llegas en las primeras 72 horas:\n• Pastilla de emergencia.\n• Prevención de ITS y VIH.\n• Recolección de evidencias.\n• Contención emocional.'**
  String get drop_der1_infoMed_72h_low;

  /// No description provided for @drop_der1_infoMed_72h_high.
  ///
  /// In es, this message translates to:
  /// **'Si pasaron más de 72 horas:\n• Pruebas de embarazo y VIH.\n• Muestras médico legales.\n• Tratamiento postraumático.'**
  String get drop_der1_infoMed_72h_high;

  /// No description provided for @ile_title.
  ///
  /// In es, this message translates to:
  /// **'Conoce tus derechos reproductivos ILE'**
  String get ile_title;

  /// No description provided for @ile_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Interrupción Legal del Embarazo (ILE)'**
  String get ile_subtitle;

  /// No description provided for @ile_definition.
  ///
  /// In es, this message translates to:
  /// **'Si quedas embarazada producto de una violación, estupro o incesto, tienes derecho a interrumpir el embarazo si así lo decides. Es tu cuerpo, es tu decisión.'**
  String get ile_definition;

  /// No description provided for @ile_req_title.
  ///
  /// In es, this message translates to:
  /// **'¿Qué necesitas?'**
  String get ile_req_title;

  /// No description provided for @ile_req_content.
  ///
  /// In es, this message translates to:
  /// **'Según la Sentencia Constitucional 0206/2014, para acceder a este servicio en cualquier centro de salud solo necesitas:\n• Tu consentimiento (tú firmas la solicitud).\n• Una copia de la denuncia (no necesitas que el juicio haya terminado).'**
  String get ile_req_content;

  /// No description provided for @ile_extra_info_title.
  ///
  /// In es, this message translates to:
  /// **'Información que debes saber:'**
  String get ile_extra_info_title;

  /// No description provided for @ile_extra_info_points.
  ///
  /// In es, this message translates to:
  /// **'• Es Gratuito: El sistema público debe cubrir todo sin costo.\n• Sin Jueces: No necesitas una orden judicial ni permiso de tus padres si eres mayor de edad (y si eres menor, prima tu interés superior).\n• Confidencial: Nadie puede revelar tu información sin tu permiso.\n• Atención Inmediata: No pueden ponerte trabas ni retrasar el procedimiento.'**
  String get ile_extra_info_points;

  /// Lema final sobre derechos reproductivos
  ///
  /// In es, this message translates to:
  /// **'Recuerda: Tú decides, la sociedad respeta, el Estado garantiza.'**
  String get ile_footer;

  /// Título principal de la pantalla de relajación
  ///
  /// In es, this message translates to:
  /// **'Manten la calma. No estás sola.'**
  String get safe_calm_title;

  /// Instrucción secundaria debajo del título
  ///
  /// In es, this message translates to:
  /// **'Respira profundo, hazlo con calma'**
  String get safe_calm_subtitle;

  /// Texto dentro del botón para comenzar el ejercicio
  ///
  /// In es, this message translates to:
  /// **'Iniciar respiración'**
  String get safe_calm_btn_start;

  /// Título de la sección de consejos rápidos
  ///
  /// In es, this message translates to:
  /// **'Paso a paso para calmarte'**
  String get safe_calm_steps_title;

  /// No description provided for @safe_calm_step1.
  ///
  /// In es, this message translates to:
  /// **'Toma asiento y relaja los hombros'**
  String get safe_calm_step1;

  /// No description provided for @safe_calm_step2.
  ///
  /// In es, this message translates to:
  /// **'Bebe un poco de agua lentamente'**
  String get safe_calm_step2;

  /// No description provided for @safe_calm_step3.
  ///
  /// In es, this message translates to:
  /// **'Respira y habla con una voz tranquila'**
  String get safe_calm_step3;

  /// No description provided for @safe_calm_step4.
  ///
  /// In es, this message translates to:
  /// **'Estira suavemente tus manos y el cuello'**
  String get safe_calm_step4;
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
