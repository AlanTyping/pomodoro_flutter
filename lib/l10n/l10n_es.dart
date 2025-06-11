// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_name => 'Pomodoro Flutter';

  @override
  String get pomodoro_title => 'Metodo Pomodoro';

  @override
  String get task_input_placeholder => 'Nueva Tarea';

  @override
  String get btn_start => 'Iniciar';

  @override
  String get add_new_task_snackbar => 'Añade una nueva tarea!';

  @override
  String get btn_save_and_restart => 'Guardar y Reiniciar';

  @override
  String get audio_config_btn_without_audio => 'sin audio';

  @override
  String get audio_config_btn_fire => 'fuego';

  @override
  String get audio_config_btn_drip => 'goteo';

  @override
  String get audio_config_btn_rain => 'lluvia';

  @override
  String get audio_config_btn_save => 'Guardar';

  @override
  String get task_card_complete => 'Completado';

  @override
  String get task_card_incomplete => 'Incompleto';

  @override
  String get task_history_appbar_title => 'Historial';

  @override
  String get task_history_apply_filters_button => 'Aplicar Filtros';

  @override
  String get task_history_input_labelText => 'Filtrar por nombre';

  @override
  String get task_history_input_hintText => 'Nombre de la tarea';

  @override
  String get task_history_delete_task_confirmation_confirm => 'Eliminar';

  @override
  String get task_history_delete_task_confirmation_cancel => 'cancelar';

  @override
  String task_history_delete_task_confirmation(String taskTitle) {
    return 'Deseas borrar esta tarea $taskTitle?';
  }

  @override
  String get task_history_input_empyDate => 'Seleccionar Fecha';

  @override
  String task_history_input_date(String formatedDate) {
    return 'Fecha: $formatedDate';
  }

  @override
  String get notification_init_working_session_title => '¡Sesión iniciada!';

  @override
  String get notification_init_working_session_description =>
      'Es momento de concentrarse.';

  @override
  String get notification_finish_working_session_title => '¡Sesión terminada!';

  @override
  String get notification_finish_working_session_description =>
      'Es momento de descansar.';

  @override
  String get notification_init_resting_session_title => '¡Tiempo de descanso!';

  @override
  String notification_init_resting_session_description(int restDuration) {
    return 'Descanso de $restDuration minutos';
  }

  @override
  String get notification_finish_resting_session_title =>
      '¡Descanso terminado!';

  @override
  String get notification_finish_resting_session_description =>
      'Es momento de concentrarse';

  @override
  String get notification_finish_pomodoro_title => 'Pomodoro completado';

  @override
  String get notification_finish_pomodoro_description => 'Buen trabajo!';

  @override
  String change_to_label(String asset) {
    return 'Cambiado a $asset';
  }

  @override
  String get pomodoro_description_app_developers_presentation =>
      'Desarrolladores';

  @override
  String get pomodoro_description_appbar_title => 'Información';

  @override
  String get pomodoro_description_first_paragraph =>
      'La Técnica Pomodoro es una estrategia para la gestión del tiempo que se basa en trabajar en sesiones de 25 minutos (llamadas \"pomodoros\") seguidas de breves descansos, para así maximizar la concentración y la productividad. Este método fue desarrollado por Francesco Cirillo en la década de 1980 como estudiante universitario.';

  @override
  String get pomodoro_how_works => 'Cómo funciona';

  @override
  String get pomodoro_1_step_description =>
      'Selección de tareas: Elige una tarea o actividad a realizar';

  @override
  String get pomodoro_2_step_description =>
      'Establecer el pomodoro: Configura un temporizador para 25 minutos';

  @override
  String get pomodoro_3_step_description =>
      'Trabajar: Durante estos 25 minutos, concéntrate únicamente en la tarea seleccionada, evitando distracciones';

  @override
  String get pomodoro_4_step_description =>
      'Descanso breve: Después de 25 minutos, toma un descanso de 5 minutos';

  @override
  String get pomodoro_5_step_description =>
      'Repetición: Repite los pasos 1 a 4 cuatro veces consecutivas';

  @override
  String get pomodoro_6_step_description =>
      'Descanso más largo: Después de la cuarta sesión (cuatro pomodoros), toma un descanso más largo de 15 a 30 minutos';

  @override
  String get pomodoro_7_step_description =>
      'Continuar: Reinicia el ciclo y continúa trabajando en tus tareas';

  @override
  String get benefits => 'Beneficios';

  @override
  String get pomodoro_1_benefit =>
      'Mejor concentración: Las sesiones cortas y los descansos te ayudan a mantener la atención';

  @override
  String get pomodoro_2_benefit =>
      'Mayor productividad: Al trabajar en bloques, puedes completar más tareas en menos tiempo';

  @override
  String get pomodoro_3_benefit =>
      'Reducción del estrés: Los descansos regulares pueden ayudar a prevenir el agotamiento';

  @override
  String get pomodoro_4_benefit =>
      'Mejor organización: La estructura de la técnica te permite planificar mejor tu tiempo y priorizar tus tareas';

  @override
  String get pomodoro_5_benefit =>
      'Fácil de implementar: La técnica es sencilla y puede ser adaptada a diversas situaciones y actividades';
}
