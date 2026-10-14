import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usuario.dart';

/// Armazena usuários localmente (SharedPreferences).
class AuthService {
  static late SharedPreferences _p;
  static Usuario? atual;

  static Future<void> init() async => _p = await SharedPreferences.getInstance();

  static List<Usuario> _todos() =>
      (jsonDecode(_p.getString('users') ?? '[]') as List)
          .map((e) => Usuario.fromJson(e))
          .toList();

  static Future<void> _salvar(List<Usuario> l) =>
      _p.setString('users', jsonEncode(l.map((e) => e.toJson()).toList()));

  /// Retorna mensagem de erro ou null se cadastrou com sucesso.
  static Future<String?> cadastrar(String nome, String email, String user, String senha) async {
    final l = _todos();
    if (l.any((u) => u.email == email.trim().toLowerCase())) return 'E-mail já cadastrado';
    if (l.any((u) => u.usuario.toLowerCase() == user.trim().toLowerCase())) return 'Nome de usuário já existe';
    l.add(Usuario(nome: nome.trim(), email: email.trim().toLowerCase(), usuario: user.trim(), senha: senha));
    await _salvar(l);
    return null;
  }

  static bool login(String id, String senha) {
    final i = id.trim().toLowerCase();
    for (final u in _todos()) {
      if ((u.email == i || u.usuario.toLowerCase() == i) && u.senha == senha) {
        atual = u;
        return true;
      }
    }
    return false;
  }

  static Future<void> salvarAtual() async {
    final l = _todos();
    final i = l.indexWhere((u) => u.email == atual!.email);
    l[i] = atual!;
    await _salvar(l);
  }

  static bool ehFavorita(int id) => atual!.favoritos.contains(id);

  static Future<void> alternarFavorita(int id) async {
    ehFavorita(id) ? atual!.favoritos.remove(id) : atual!.favoritos.add(id);
    await salvarAtual();
  }

  static void logout() => atual = null;
}
