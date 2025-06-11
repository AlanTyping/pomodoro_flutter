import 'package:shared_preferences/shared_preferences.dart';

class AudioConfigSharedPreferences {
  static SharedPreferences? _preferences;
  static const _audioConfig = "audio_config";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAudioConfig(String audio) async =>
      await _preferences!.setString(_audioConfig, audio);

  static String? getAudioconfig() => _preferences!.getString(_audioConfig);
}
