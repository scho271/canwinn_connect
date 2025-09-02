

import 'package:app_settings/app_settings.dart';
import 'package:app_settings/app_settings_platform_interface.dart';

class AppSettings {
  static Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) {
    return AppSettingsPlatform.instance.openAppSettings(type: type, asAnotherTask: asAnotherTask);
  }

  static Future<void> openAppSettingsPanel(AppSettingsPanelType type) {
    return AppSettingsPlatform.instance.openAppSettingsPanel(type);
  }
}
