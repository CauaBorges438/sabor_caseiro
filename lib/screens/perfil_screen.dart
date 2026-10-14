import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';
import 'editar_perfil_screen.dart';
import 'login_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});
  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  void _sair() {
    AuthService.logout();
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final u = AuthService.atual!;
    return ListView(padding: const EdgeInsets.all(24), children: [
      const Center(
        child: CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/avatar.png')),
      ),
      const SizedBox(height: 16),
      Center(child: Text(u.nome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      Center(child: Text('@${u.usuario}', style: TextStyle(color: Colors.grey.shade700))),
      const SizedBox(height: 16),
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(u.bio, textAlign: TextAlign.center))),
      const SizedBox(height: 8),
      Text('❤ ${u.favoritos.length} receita(s) favorita(s)', textAlign: TextAlign.center),
      const SizedBox(height: 24),
      ElevatedButton.icon(
        icon: const Icon(Icons.edit),
        label: const Text('Editar perfil'),
        onPressed: () async {
          final salvou = await Navigator.push<bool>(context, MaterialPageRoute(builder: (_) => const EditarPerfilScreen()));
          if (salvou == true && mounted) {
            setState(() {});
            mostrarMsg(context, 'Dados atualizados com sucesso!');
          }
        },
      ),
      const SizedBox(height: 12),
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        icon: const Icon(Icons.logout),
        label: const Text('Sair'),
        onPressed: _sair,
      ),
    ]);
  }
}
