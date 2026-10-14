import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';

class DetalheReceitaScreen extends StatefulWidget {
  final Receita receita;
  const DetalheReceitaScreen({super.key, required this.receita});
  @override
  State<DetalheReceitaScreen> createState() => _DetalheReceitaScreenState();
}

class _DetalheReceitaScreenState extends State<DetalheReceitaScreen> {
  @override
  Widget build(BuildContext context) {
    final r = widget.receita;
    final fav = AuthService.ehFavorita(r.id);
    return Scaffold(
      appBar: AppBar(title: Text(r.nome)),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        icon: Icon(fav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
        label: Text(fav ? 'Salva' : 'Salvar', style: const TextStyle(color: Colors.red)),
        onPressed: () async {
          await AuthService.alternarFavorita(r.id);
          if (!mounted) return;
          setState(() {});
          mostrarMsg(context, fav ? 'Receita removida das favoritas' : 'Receita salva nas favoritas!');
        },
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
          height: 160, alignment: Alignment.center,
          decoration: BoxDecoration(color: r.cor, borderRadius: BorderRadius.circular(20)),
          child: Text(r.emoji, style: const TextStyle(fontSize: 80)),
        ),
        const SizedBox(height: 16),
        Text('${r.categoria} • ${r.minutos} min', style: TextStyle(color: Colors.grey.shade700)),
        const SizedBox(height: 16),
        const Text('Ingredientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ...r.ingredientes.map((e) => ListTile(dense: true, leading: const Icon(Icons.check_circle_outline), title: Text(e))),
        const SizedBox(height: 12),
        const Text('Modo de preparo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ...List.generate(
          r.preparo.length,
          (i) => ListTile(
            dense: true,
            leading: CircleAvatar(radius: 12, child: Text('${i + 1}', style: const TextStyle(fontSize: 12))),
            title: Text(r.preparo[i]),
          ),
        ),
        const SizedBox(height: 70),
      ]),
    );
  }
}
