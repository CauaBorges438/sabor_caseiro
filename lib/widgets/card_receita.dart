import 'package:flutter/material.dart';
import '../models/receita.dart';

class CardReceita extends StatelessWidget {
  final Receita receita;
  final bool favorita;
  final VoidCallback onTap, onFavoritar;

  const CardReceita({
    super.key, required this.receita, required this.favorita,
    required this.onTap, required this.onFavoritar,
  });

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Container(
                width: 72, height: 72, alignment: Alignment.center,
                decoration: BoxDecoration(color: receita.cor, borderRadius: BorderRadius.circular(16)),
                child: Text(receita.emoji, style: const TextStyle(fontSize: 36)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(receita.nome, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${receita.categoria} • ${receita.minutos} min', style: TextStyle(color: Colors.grey.shade700)),
                ]),
              ),
              IconButton(
                icon: Icon(favorita ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                onPressed: onFavoritar,
              ),
            ]),
          ),
        ),
      );
}
