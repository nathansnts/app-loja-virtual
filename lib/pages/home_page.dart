// ignore: implementation_imports

import 'package:app_loja_virtual/widgets/drawer_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRINCIPAIS NOVIDADES',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerCustom(),
      body: FutureBuilder<QuerySnapshot>(
          future: db.collection('homepage').orderBy('pos').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 15,
                      ),
                      Text('CARREGANDO...')
                    ]),
              );
            } else {
              final documents = snapshot.data!.docs;

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(245, 0, 87, 1),
                            Color.fromRGBO(248, 187, 208, 1)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                        ),
                        //Ajustar a imagem conforme seu tamanho
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          final data =
                              documents[index].data() as Map<String, dynamic>;
                          final imageUrl = data['image'] as String;
                          final x = data['x'] as int;
                          final y = data['y'] as int;

                          // Widget para suavizar o carregando da imagem
                          return FadeInImage.memoryNetwork(
                              fadeInDuration: const Duration(seconds: 2),
                              fadeOutDuration: const Duration(seconds: 2),
                              height: x.toDouble(),
                              width: y.toDouble(),
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: imageUrl);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
