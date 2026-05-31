import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/app_theme.dart';
import 'engine/vault_controller.dart';
import 'ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppTheme.bgDeep,
  ));

  final vc = VaultController();
  await vc.init();

  runApp(
    ChangeNotifierProvider.value(
      value: vc,
      child: const ChronoVaultApp(),
    ),
  );
}

class ChronoVaultApp extends StatelessWidget {
  const ChronoVaultApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoVault',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const SplashScreen(),
    );
  }
}
