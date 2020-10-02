import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumbers = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  /// Método que inicializa la página. Se ejecuta antes del build
  @override
  void initState() {
    super.initState();

    _addMoreImages();

    _scrollController.addListener(() {
      // Si el scroll llega al máximo (final de pantalla), carga más imágenes
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addMoreImages();
        _fetchData();
      }
    });
  }

  // Método que destruye la página. Se ejecuta al salir
  @override
  void dispose() {
    super.dispose();
    // Eliminamos el controlador de scroll cuando abandona la página
    // Porque sino se acumulan en memoria cada vez que entramos
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        /// Muestra en la página la lista y el loading apilados.
        /// el loading solo se verá cuando sea necesario
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  // Crea lista de elememtos junto el PullRefresh
  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _loadFirstPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _listNumbers[index];
            return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'),
              height: 300.0,
              fit: BoxFit.cover,
            );
          }),
    );
  }

  // Future que limpia la lista y carga nuevas imágenes
  Future<Null> _loadFirstPage() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _addMoreImages();
    });

    return Future.delayed(duration);
  }

  // Carga 10 nuevas imágenes
  void _addMoreImages() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {});
  }

  // Trae nuevas imágenes simulando una carga demorada
  Future _fetchData() async {
    // Simula un delay
    _isLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    new Timer(duration, _moveToNewImages);
  }

  // Teriman la carga y avanza el scroll para mostrar las nuevas imágenes
  void _moveToNewImages() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addMoreImages();
  }

  // Muestra el loading cuando sea necesario
  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
