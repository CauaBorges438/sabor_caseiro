import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(const SaborCaseiroApp());
}

class SaborCaseiroApp extends StatelessWidget {
  const SaborCaseiroApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sabor Caseiro',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.tema,
        home: const LoginScreen(),
      );
}
