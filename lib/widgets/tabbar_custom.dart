import 'package:flutter/material.dart';

import 'package:app_loja_virtual/widgets/drawer_custom.dart';

class TabBarCustom extends StatelessWidget {
  String title;
  //List<String> imgs = [];
  double price;
  //List<String> sizes = [],

  TabBarCustom({
    Key? key,
    this.title = '',
    //this.imgs,
    this.price = 0.0,
    //this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.grid_on),
            ),
            Tab(
              icon: Icon(Icons.list),
            )
          ]),
        ),
        drawer: const DrawerCustom(),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: const [
                Center(child: Text('IMAGEM AQUI')),
              ],
            ),
            ListView(
              children: const [
                Center(child: Text('IMAGEM AQUI')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
