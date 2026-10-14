import 'package:flutter/material.dart';
import '../models/receita.dart';

const categorias = ['Todas', 'Massas', 'Doces', 'Saladas', 'Carnes'];

const receitas = <Receita>[
  Receita(
    id: 1, nome: 'Macarrão à Carbonara', categoria: 'Massas', emoji: '🍝',
    minutos: 25, cor: Color(0xFFFFE0B2),
    ingredientes: ['250 g de espaguete', '100 g de bacon em cubos', '2 ovos', '50 g de queijo parmesão', 'Pimenta-do-reino'],
    preparo: ['Cozinhe o espaguete em água com sal.', 'Frite o bacon até dourar.', 'Misture os ovos com o queijo.', 'Junte a massa ao bacon fora do fogo e misture o creme de ovos.'],
  ),
  Receita(
    id: 2, nome: 'Bolo de Chocolate', categoria: 'Doces', emoji: '🍫',
    minutos: 60, cor: Color(0xFFD7CCC8),
    ingredientes: ['3 ovos', '2 xícaras de açúcar', '2 xícaras de farinha', '1 xícara de chocolate em pó', '1 xícara de leite', '1 colher de fermento'],
    preparo: ['Bata ovos, açúcar e leite.', 'Acrescente os secos e misture.', 'Adicione o fermento por último.', 'Asse a 180 °C por 40 minutos.'],
  ),
  Receita(
    id: 3, nome: 'Salada Caprese', categoria: 'Saladas', emoji: '🥗',
    minutos: 10, cor: Color(0xFFC8E6C9),
    ingredientes: ['3 tomates', '200 g de muçarela de búfala', 'Folhas de manjericão', 'Azeite', 'Sal'],
    preparo: ['Fatie tomates e muçarela.', 'Intercale em um prato com o manjericão.', 'Tempere com azeite e sal.'],
  ),
  Receita(
    id: 4, nome: 'Strogonoff de Frango', categoria: 'Carnes', emoji: '🍗',
    minutos: 40, cor: Color(0xFFFFCCBC),
    ingredientes: ['500 g de peito de frango', '1 cebola', '1 caixinha de creme de leite', '4 colheres de ketchup', '1 lata de champignon'],
    preparo: ['Refogue a cebola e o frango em cubos.', 'Adicione ketchup e champignon.', 'Desligue o fogo e misture o creme de leite.'],
  ),
  Receita(
    id: 5, nome: 'Brigadeiro', categoria: 'Doces', emoji: '🍬',
    minutos: 20, cor: Color(0xFFBCAAA4),
    ingredientes: ['1 lata de leite condensado', '3 colheres de chocolate em pó', '1 colher de manteiga', 'Granulado'],
    preparo: ['Misture tudo em uma panela.', 'Cozinhe mexendo até desgrudar do fundo.', 'Deixe esfriar, enrole e passe no granulado.'],
  ),
  Receita(
    id: 6, nome: 'Lasanha à Bolonhesa', categoria: 'Massas', emoji: '🍕',
    minutos: 75, cor: Color(0xFFFFF59D),
    ingredientes: ['12 folhas de lasanha', '500 g de carne moída', '2 xícaras de molho de tomate', '300 g de presunto', '300 g de muçarela', 'Molho branco'],
    preparo: ['Prepare o molho com a carne moída.', 'Monte camadas de massa, molho, presunto e queijo.', 'Cubra com molho branco e queijo.', 'Asse por 30 minutos.'],
  ),
];
