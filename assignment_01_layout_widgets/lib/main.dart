import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedido Flash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5A1F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF5A1F),
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Pedido Flash"),
          ),
          drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF5A1F),
                          Color(0xFFFFA53A),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Menu Caixa",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                         ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_shopping_cart),
                    title: Text(
                        "Novo Pedido",
                        style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.history_outlined),
                    title: Text(
                      "Histórico",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      "Configurações",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ]
            ),
          ),
      )
    );
  }
}