// home.dart
// Atividade: Estrutura do Scaffold - Desafio Dashboard Completo
// Widgets usados: Scaffold, AppBar, Drawer, EndDrawer,
// SingleChildScrollView + Row (horizontal),
// SingleChildScrollView + Column (vertical), BottomNavigationBar e Container.

import 'package:flutter/material.dart';

// Tela principal do app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: estrutura básica de uma tela do Material Design
    return Scaffold(
      // APPBAR (barra superior)
      appBar: AppBar(
        title: const Text('Título'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        // Quando existe um Drawer, o Flutter coloca o ícone de menu
        // automaticamente à esquerda. Aqui ele é colocado à mão para ficar
        // igual ao modelo.
        leading: Builder(
          // O Builder fornece um "context" que enxerga o Scaffold,
          // necessário para abrir o Drawer.
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          // Ícone de configurações à direita: abre o EndDrawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      // DRAWER (menu lateral da ESQUERDA)
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer (esquerda)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // Gera 7 itens na lista, como no modelo
            for (int i = 1; i <= 7; i++)
              ListTile(
                leading: const Icon(Icons.circle_outlined),
                title: Text('Item $i'),
              ),
          ],
        ),
      ),

      // ENDDRAWER (menu lateral da DIREITA)
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'EndDrawer (direita)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            for (int i = 1; i <= 7; i++)
              ListTile(
                leading: const Icon(Icons.circle_outlined),
                title: Text('Opção $i'),
              ),
          ],
        ),
      ),

      // BODY (corpo da tela)
      body: Column(
        children: [
          // --- Rolagem HORIZONTAL (círculos) ---
          // O SizedBox define uma altura fixa para a faixa de círculos
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // rola para os lados
              child: Row(
                // List.generate cria 8 círculos iguais
                children: List.generate(
                  8,
                  (_) => Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle, // formato de círculo
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- Rolagem VERTICAL (retângulos) ---
          // O Expanded faz esta parte ocupar todo o espaço que sobra na tela
          Expanded(
            child: SingleChildScrollView(
              // a rolagem vertical é o padrão, não precisa informar
              child: Column(
                // List.generate cria 10 retângulos iguais
                children: List.generate(
                  10,
                  (_) => Container(
                    width: double.infinity, // ocupa toda a largura
                    height: 120,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8), // cantos arredondados
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // BOTTOMNAVIGATIONBAR (barra inferior)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        // A BottomNavigationBar precisa de pelo menos 2 itens
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
