import 'package:app_loja_virtual/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP LOJA VIRTUAL'),
      ),
      drawer: const DrawerCustom(),
      body: const Center(
        child: Text('PLACES.....'),
      ),
    );
  }
}
