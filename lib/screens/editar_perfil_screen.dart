import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';
import '../widgets/campo_texto.dart';

class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});
  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _form = GlobalKey<FormState>();
  final _u = AuthService.atual!;
  late final _nome = TextEditingController(text: _u.nome);
  late final _user = TextEditingController(text: _u.usuario);
  late final _bio = TextEditingController(text: _u.bio);

  Future<void> _salvar() async {
    if (!_form.currentState!.validate()) return;
    _u.nome = _nome.text.trim();
    _u.usuario = _user.text.trim();
    _u.bio = _bio.text.trim();
    await AuthService.salvarAtual();
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Editar perfil')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _form,
            child: Column(children: [
              CampoTexto(controller: _nome, label: 'Nome', icone: Icons.badge_outlined, validator: obrigatorio),
              CampoTexto(controller: _user, label: 'Nome de usuário', icone: Icons.alternate_email, validator: obrigatorio),
              CampoTexto(controller: _bio, label: 'Biografia', icone: Icons.notes, maxLinhas: 3, validator: obrigatorio),
              ElevatedButton(onPressed: _salvar, child: const Text('Salvar')),
            ]),
          ),
        ),
      );
}
