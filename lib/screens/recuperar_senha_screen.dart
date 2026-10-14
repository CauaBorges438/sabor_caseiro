import 'package:flutter/material.dart';
import '../utils/helpers.dart';
import '../widgets/campo_texto.dart';

class RecuperarSenhaScreen extends StatefulWidget {
  const RecuperarSenhaScreen({super.key});
  @override
  State<RecuperarSenhaScreen> createState() => _RecuperarSenhaScreenState();
}

class _RecuperarSenhaScreenState extends State<RecuperarSenhaScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();

  void _recuperar() {
    if (!_form.currentState!.validate()) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Solicitação realizada'),
        content: Text('Enviamos as instruções de recuperação para ${_email.text.trim()}.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Recuperar senha')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _form,
            child: Column(children: [
              const Text('Informe o e-mail cadastrado para receber as instruções.'),
              const SizedBox(height: 20),
              CampoTexto(controller: _email, label: 'E-mail', icone: Icons.email_outlined, validator: validarEmail, teclado: TextInputType.emailAddress),
              ElevatedButton(onPressed: _recuperar, child: const Text('Recuperar senha')),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Voltar ao login')),
            ]),
          ),
        ),
      );
}
