import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _componentsList(),
    );
  }

  Widget _componentsList() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> options = [];

    data.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element['texto']),
        leading: Icon(
          Icons.account_balance_wallet,
          color: Colors.blue,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {},
      );

      options..add(tempWidget)..add(Divider());
    });

    return options;
  }
}
