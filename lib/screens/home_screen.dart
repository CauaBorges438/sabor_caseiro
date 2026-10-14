import 'package:flutter/material.dart';
import 'lista_receitas_screen.dart';
import 'perfil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _aba = 0;
  static const _titulos = ['Receitas', 'Favoritas', 'Meu Perfil'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(_titulos[_aba])),
        body: [
          const ListaReceitasScreen(apenasFavoritas: false),
          const ListaReceitasScreen(apenasFavoritas: true),
          const PerfilScreen(),
        ][_aba],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _aba,
          onDestinationSelected: (i) => setState(() => _aba = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.restaurant_menu), label: 'Receitas'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoritas'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      );
}
