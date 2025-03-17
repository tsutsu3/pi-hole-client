import 'dart:io';

int getAndroidVersion() {
  if (Platform.isAndroid) {
    final version = Platform.version.split('.').first;
    return int.tryParse(version) ?? -1;
  }
  return -1;
}

String convertTemperatureUnit(String? unit) {
  switch (unit) {
    case 'C':
      return '℃';
    case 'F':
      return '℉';
    case 'K':
      return 'K';
    default:
      return '';
  }
}
