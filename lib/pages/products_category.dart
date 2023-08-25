import 'package:app_loja_virtual/widgets/drawer_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsCategory extends StatelessWidget {
  ProductsCategory({super.key});
  late String categoryProduct;

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATEGORIA DE PRODUTOS'),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      drawer: const DrawerCustom(),
      body: FutureBuilder<QuerySnapshot>(
          future: db.collection('products').get(),
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
              var data = snapshot.data!.docs;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  //Convertendo em um mapa para leitura dos dados
                  Map productMap = data[index].data() as Map<String, dynamic>;
                  final img = productMap['icon'] as String;
                  final title = productMap['title'] as String;
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(img)),
                    title: Text(title),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      Navigator.pushNamed(context, '/productcategoryselected');
                    },
                  );
                },
              );
            }
          }),
    );
  }
}
