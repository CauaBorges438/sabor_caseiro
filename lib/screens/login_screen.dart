import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';
import '../widgets/campo_senha.dart';
import '../widgets/campo_texto.dart';
import 'cadastro_screen.dart';
import 'home_screen.dart';
import 'recuperar_senha_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _senha = TextEditingController();

  void _entrar() {
    if (!_form.currentState!.validate()) return;
    if (AuthService.login(_id.text, _senha.text)) {
      mostrarMsg(context, 'Login realizado com sucesso!');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      mostrarMsg(context, 'Usuário ou senha inválidos', erro: true);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _form,
                child: Column(children: [
                  const Text('🍳', style: TextStyle(fontSize: 72)),
                  const Text('Sabor Caseiro',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFE4572E))),
                  const SizedBox(height: 28),
                  CampoTexto(controller: _id, label: 'E-mail ou usuário', icone: Icons.person_outline, validator: obrigatorio),
                  CampoSenha(controller: _senha, validator: obrigatorio),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecuperarSenhaScreen())),
                      child: const Text('Esqueci minha senha'),
                    ),
                  ),
                  ElevatedButton(onPressed: _entrar, child: const Text('Entrar')),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CadastroScreen())),
                    child: const Text('Não tem conta? Cadastre-se'),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
}
