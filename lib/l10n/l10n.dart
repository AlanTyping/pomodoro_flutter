import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
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
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// No description provided for @app_name.
  ///
  /// In es, this message translates to:
  /// **'Pomodoro Flutter'**
  String get app_name;

  /// No description provided for @pomodoro_title.
  ///
  /// In es, this message translates to:
  /// **'Metodo Pomodoro'**
  String get pomodoro_title;

  /// No description provided for @btn_start.
  ///
  /// In es, this message translates to:
  /// **'Iniciar'**
  String get btn_start;

  /// No description provided for @btn_save_and_restart.
  ///
  /// In es, this message translates to:
  /// **'Guardar y Reiniciar'**
  String get btn_save_and_restart;

  /// Texto que dice que se actualizo a otro ASSET
  ///
  /// In es, this message translates to:
  /// **'Cambiado a {asset}'**
  String change_to_label(String asset);

  /// No description provided for @pomodoro_description_first_paragraph.
  ///
  /// In es, this message translates to:
  /// **'La Técnica Pomodoro es una estrategia para la gestión del tiempo que se basa en trabajar en sesiones de 25 minutos (llamadas \"pomodoros\") seguidas de breves descansos, para así maximizar la concentración y la productividad. Este método fue desarrollado por Francesco Cirillo en la década de 1980 como estudiante universitario.'**
  String get pomodoro_description_first_paragraph;

  /// No description provided for @pomodoro_how_works.
  ///
  /// In es, this message translates to:
  /// **'Cómo funciona'**
  String get pomodoro_how_works;

  /// No description provided for @pomodoro_1_step_description.
  ///
  /// In es, this message translates to:
  /// **'Selección de tareas: Elige una tarea o actividad a realizar'**
  String get pomodoro_1_step_description;

  /// No description provided for @pomodoro_2_step_description.
  ///
  /// In es, this message translates to:
  /// **'Establecer el pomodoro: Configura un temporizador para 25 minutos'**
  String get pomodoro_2_step_description;

  /// No description provided for @pomodoro_3_step_description.
  ///
  /// In es, this message translates to:
  /// **'Trabajar: Durante estos 25 minutos, concéntrate únicamente en la tarea seleccionada, evitando distracciones'**
  String get pomodoro_3_step_description;

  /// No description provided for @pomodoro_4_step_description.
  ///
  /// In es, this message translates to:
  /// **'Descanso breve: Después de 25 minutos, toma un descanso de 5 minutos'**
  String get pomodoro_4_step_description;

  /// No description provided for @pomodoro_5_step_description.
  ///
  /// In es, this message translates to:
  /// **'Repetición: Repite los pasos 1 a 4 cuatro veces consecutivas'**
  String get pomodoro_5_step_description;

  /// No description provided for @pomodoro_6_step_description.
  ///
  /// In es, this message translates to:
  /// **'Descanso más largo: Después de la cuarta sesión (cuatro pomodoros), toma un descanso más largo de 15 a 30 minutos'**
  String get pomodoro_6_step_description;

  /// No description provided for @pomodoro_7_step_description.
  ///
  /// In es, this message translates to:
  /// **'Continuar: Reinicia el ciclo y continúa trabajando en tus tareas'**
  String get pomodoro_7_step_description;

  /// No description provided for @benefits.
  ///
  /// In es, this message translates to:
  /// **'Beneficios'**
  String get benefits;

  /// No description provided for @pomodoro_1_benefit.
  ///
  /// In es, this message translates to:
  /// **'Mejor concentración: Las sesiones cortas y los descansos te ayudan a mantener la atención'**
  String get pomodoro_1_benefit;

  /// No description provided for @pomodoro_2_benefit.
  ///
  /// In es, this message translates to:
  /// **'Mayor productividad: Al trabajar en bloques, puedes completar más tareas en menos tiempo'**
  String get pomodoro_2_benefit;

  /// No description provided for @pomodoro_3_benefit.
  ///
  /// In es, this message translates to:
  /// **'Reducción del estrés: Los descansos regulares pueden ayudar a prevenir el agotamiento'**
  String get pomodoro_3_benefit;

  /// No description provided for @pomodoro_4_benefit.
  ///
  /// In es, this message translates to:
  /// **'Mejor organización: La estructura de la técnica te permite planificar mejor tu tiempo y priorizar tus tareas'**
  String get pomodoro_4_benefit;

  /// No description provided for @pomodoro_5_benefit.
  ///
  /// In es, this message translates to:
  /// **'Fácil de implementar: La técnica es sencilla y puede ser adaptada a diversas situaciones y actividades'**
  String get pomodoro_5_benefit;
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
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
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
