import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/settings_viewmodel.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vendas App',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                IconButton(
                  icon: Icon(
                    settings.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    settings.toggleTheme();
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Clientes'),
            onTap: () {
              Navigator.pushNamed(context, '/clients');
            },
          ),
          ListTile(
            title: Text('Produtos'),
            onTap: () {
              Navigator.pushNamed(context, '/products');
            },
          ),
          ListTile(
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, '/categories');
            },
          ),
          ListTile(
            title: Text('Pedidos'),
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
        ],
      ),
    );
  }
}
