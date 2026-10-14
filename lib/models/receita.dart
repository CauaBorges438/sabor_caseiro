import 'package:flutter/material.dart';

class Receita {
  final int id;
  final String nome, categoria, emoji;
  final int minutos;
  final Color cor;
  final List<String> ingredientes, preparo;

  const Receita({
    required this.id, required this.nome, required this.categoria,
    required this.emoji, required this.minutos, required this.cor,
    required this.ingredientes, required this.preparo,
  });
}
