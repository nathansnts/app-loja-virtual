import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Nathan',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              accountEmail: Text(
                'nathan@email.com',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'N',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.house_outlined),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
              title: const Text('INICIO'),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.list_alt),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/productscategory');
              },
              title: const Text('PRODUTOS'),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.gps_fixed_outlined),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/places');
              },
              title: const Text('LOCALIZAR UMA LOJA'),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.grading_outlined),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/requests');
              },
              title: const Text('MEUS PEDIDOS'),
            )
          ],
        ),
      ),
    );
  }
}
