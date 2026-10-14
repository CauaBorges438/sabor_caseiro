import 'package:flutter/material.dart';
import '../data/receitas_mock.dart';
import '../services/auth_service.dart';
import '../utils/helpers.dart';
import '../widgets/card_receita.dart';
import 'detalhe_receita_screen.dart';

class ListaReceitasScreen extends StatefulWidget {
  final bool apenasFavoritas;
  const ListaReceitasScreen({super.key, required this.apenasFavoritas});
  @override
  State<ListaReceitasScreen> createState() => _ListaReceitasScreenState();
}

class _ListaReceitasScreenState extends State<ListaReceitasScreen> {
  String _cat = 'Todas';

  @override
  Widget build(BuildContext context) {
    final lista = receitas.where((r) =>
        (_cat == 'Todas' || r.categoria == _cat) &&
        (!widget.apenasFavoritas || AuthService.ehFavorita(r.id))).toList();

    return Column(children: [
      SizedBox(
        height: 56,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          children: categorias
              .map((c) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(label: Text(c), selected: _cat == c, onSelected: (_) => setState(() => _cat = c)),
                  ))
              .toList(),
        ),
      ),
      Expanded(
        child: lista.isEmpty
            ? Center(child: Text(widget.apenasFavoritas ? 'Você ainda não favoritou receitas 💔' : 'Nenhuma receita encontrada'))
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                itemCount: lista.length,
                itemBuilder: (_, i) {
                  final r = lista[i];
                  return CardReceita(
                    receita: r,
                    favorita: AuthService.ehFavorita(r.id),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetalheReceitaScreen(receita: r)))
                        .then((_) => setState(() {})),
                    onFavoritar: () async {
                      final era = AuthService.ehFavorita(r.id);
                      await AuthService.alternarFavorita(r.id);
                      if (!mounted) return;
                      setState(() {});
                      mostrarMsg(context, era ? 'Receita removida das favoritas' : 'Receita salva nas favoritas!');
                    },
                  );
                },
              ),
      ),
    ]);
  }
}
