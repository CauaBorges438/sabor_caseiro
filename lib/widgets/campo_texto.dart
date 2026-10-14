import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icone;
  final String? Function(String?)? validator;
  final TextInputType? teclado;
  final int maxLinhas;

  const CampoTexto({
    super.key, required this.controller, required this.label,
    required this.icone, this.validator, this.teclado, this.maxLinhas = 1,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: teclado,
          maxLines: maxLinhas,
          decoration: InputDecoration(labelText: label, prefixIcon: Icon(icone)),
        ),
      );
}
