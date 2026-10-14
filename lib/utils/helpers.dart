import 'package:flutter/material.dart';

void mostrarMsg(BuildContext c, String msg, {bool erro = false}) {
  ScaffoldMessenger.of(c).hideCurrentSnackBar();
  ScaffoldMessenger.of(c).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: erro ? Colors.red.shade700 : Colors.green.shade700,
    behavior: SnackBarBehavior.floating,
  ));
}

String? obrigatorio(String? v) =>
    (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null;

String? validarEmail(String? v) {
  if (v == null || v.trim().isEmpty) return 'Campo obrigatório';
  final ok = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(v.trim());
  return ok ? null : 'E-mail inválido';
}

String? validarSenha(String? v) {
  if (v == null || v.isEmpty) return 'Campo obrigatório';
  return v.length < 6 ? 'Mínimo de 6 caracteres' : null;
}
