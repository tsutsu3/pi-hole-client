import 'dart:io';

int getAndroidVersion() {
  if (Platform.isAndroid) {
    final version = Platform.version.split('.').first;
    return int.tryParse(version) ?? -1;
  }
  return -1;
}
