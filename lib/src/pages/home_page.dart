import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
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
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: getIcon('keyboard_arrow_right'),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );

      options..add(tempWidget)..add(Divider());
    });

    return options;
  }
}
