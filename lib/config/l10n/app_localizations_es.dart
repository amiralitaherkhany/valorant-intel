// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Información de Valorant';

  @override
  String get agents => 'Agentes';

  @override
  String get none => 'ninguno';

  @override
  String get weapons => 'Armes';

  @override
  String get maps => 'Mapas';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get pullToRefresh => 'Desliza para actualizar';

  @override
  String get home => 'Inicio';

  @override
  String get collections => 'Colecciones';

  @override
  String get game => 'Juego';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Configuración';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get networkFailure => 'Verifica tu conexión a internet';

  @override
  String get serverError => 'Algo salió mal';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String cachedContent(String error) {
    return 'No se pudieron obtener los datos más recientes. Mostrando contenido almacenado anteriormente - Error: $error';
  }
}
