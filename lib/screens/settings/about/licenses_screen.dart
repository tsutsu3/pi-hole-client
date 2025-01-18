import 'package:flutter/material.dart' hide LicensePage;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/screens/settings/about/about.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          final packageInfo = snapshot.data!;
          return Scaffold(
            body: SafeArea(
              child: LicensePage(
                applicationVersion: packageInfo.version,
                applicationIcon: Image.asset(
                  'assets/icon/icon-foreground.png',
                  width: 48,
                  height: 48,
                ),
                applicationLegalese: '© ${DateTime.now().year} tsutsu3',
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('Unexpected error occurred'),
              ),
            ),
          );
        }
      },
    );
  }
}
