import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';
import '../widgets/campo_senha.dart';
import '../widgets/campo_texto.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});
  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _user = TextEditingController();
  final _senha = TextEditingController();
  final _conf = TextEditingController();

  Future<void> _cadastrar() async {
    if (!_form.currentState!.validate()) return;
    final erro = await AuthService.cadastrar(_nome.text, _email.text, _user.text, _senha.text);
    if (!mounted) return;
    if (erro != null) return mostrarMsg(context, erro, erro: true);
    mostrarMsg(context, 'Cadastro realizado com sucesso!');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _form,
            child: Column(children: [
              CampoTexto(controller: _nome, label: 'Nome', icone: Icons.badge_outlined, validator: obrigatorio),
              CampoTexto(controller: _email, label: 'E-mail', icone: Icons.email_outlined, validator: validarEmail, teclado: TextInputType.emailAddress),
              CampoTexto(controller: _user, label: 'Nome de usuário', icone: Icons.alternate_email, validator: obrigatorio),
              CampoSenha(controller: _senha, validator: validarSenha),
              CampoSenha(
                controller: _conf,
                label: 'Confirmar senha',
                validator: (v) => v != _senha.text ? 'As senhas não coincidem' : obrigatorio(v),
              ),
              const SizedBox(height: 8),
              ElevatedButton(onPressed: _cadastrar, child: const Text('Cadastrar')),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Já tenho conta! Voltar ao login')),
            ]),
          ),
        ),
      );
}
