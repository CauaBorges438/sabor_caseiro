import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const CampoSenha({super.key, required this.controller, this.label = 'Senha', this.validator});

  @override
  State<CampoSenha> createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  bool _oculta = true;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _oculta,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.label,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_oculta ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _oculta = !_oculta),
            ),
          ),
        ),
      );
}
